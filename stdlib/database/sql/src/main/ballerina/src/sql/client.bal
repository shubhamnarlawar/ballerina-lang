// Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerinax/java;

# Represents a SQL client.
#
public type Client abstract client object {

    # Queries the database with the query provided by the user, and returns the result as stream.
    #
    # + sqlQuery - The query which needs to be executed
    # + rowType - The `typedesc` of the record that should be returned as a result. If this is not provided the default
    #             column names of the query result set be used for the record attributes
    # + return - Stream of records in the type of `rowType`
    public remote function query(@untainted string sqlQuery, typedesc<record {}>? rowType = ())
    returns stream<record{}, Error>;

    # Executes the DDL or DML sql queries provided by the user, and returns summary of the execution.
    #
    # + sqlQuery - The DDL or DML query such as INSERT, DELETE, UPDATE, etc
    # + return - Summary of the sql update query as `ExecuteResult` or returns `Error`
    #           if any error occured when executing the query
    public remote function execute(@untainted string sqlQuery) returns ExecuteResult|Error?;

    # Close the SQL client.
    #
    # + return - Possible error during closing the client
    public function close() returns Error?;
};

# The result of the query without returning the rows.
#
# + affectedRowCount - Number of rows affected by the execution of the query
# + lastInsertId - The integer or string generated by the database in response to a query execution.
#                  Typically this will be from an "auto increment" column when inserting a new row. Not all databases
#                  support this feature, and hence it can be also nil
public type ExecuteResult record {
    int? affectedRowCount;
    string|int? lastInsertId;
};

type ResultIterator object {
    private boolean isClosed = false;
    private Error? err;

    public function __init(public Error? err = ()) {
        self.err = err;
    }

    public function next() returns record {|record {} value;|}|Error? {
        if (self.isClosed) {
            return closedStreamInvocationError();
        }
        error? closeErrorIgnored = ();
        if (self.err is Error) {
            return self.err;
        } else {
            record {}|Error? result = nextResult(self);
            if (result is record {}) {
                record {|
                    record {} value;
                |} streamRecord = {value: result};
                return streamRecord;
            } else if (result is Error) {
                self.err = result;
                closeErrorIgnored = self.close();
                return self.err;
            } else {
                closeErrorIgnored = self.close();
                return result;
            }
        }
    }

    public function close() returns Error? {
        if (!self.isClosed) {
            if (self.err is ()) {
                Error? e = closeResult(self);
                if (e is ()) {
                    self.isClosed = true;
                }
                return e;
            }
        }
    }
};

function closedStreamInvocationError() returns Error {
    ApplicationError e = ApplicationError(message = "Stream is closed. Therefore, "
        + "no operations are allowed further on the stream.");
    return e;
}


public function generateApplicationErrorStream(string message) returns stream<record{}, Error> {
    ApplicationError applicationErr = ApplicationError(message = message);
    ResultIterator resultIterator = new (err = applicationErr);
    stream<record{}, Error> errorStream = new (resultIterator);
    return errorStream;
}

function nextResult(ResultIterator iterator) returns record {}|Error? = @java:Method {
    class: "org.ballerinalang.sql.utils.RecordItertorUtils"
} external;

function closeResult(ResultIterator iterator) returns Error? = @java:Method {
    class: "org.ballerinalang.sql.utils.RecordItertorUtils"
} external;
