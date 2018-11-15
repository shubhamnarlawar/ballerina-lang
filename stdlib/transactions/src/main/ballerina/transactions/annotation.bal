// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

///////////////////////////
/// Service Annotations ///
///////////////////////////

// record

//public annotation <service> Participant TransactionParticipantConfig;



////////////////////////////
/// Function Annotations ///
////////////////////////////

# Contains the configurations for local transaction participant function.
#
# + oncommitFunc - Function to execute when transaction committed.
# + onabortFunc - Function to execute when transaction aborted.
# + canInitiate - Annotated entity can initiate a transaction if transaction is not present.
public type TransactionParticipantConfig record {
    function (string)? oncommitFunc;
    function (string)? onabortFunc;
    boolean? canInitiate;
    !...
};

# The annotation which is used to configure local transaction participant function.
public annotation <function, resource> Participant TransactionParticipantConfig;