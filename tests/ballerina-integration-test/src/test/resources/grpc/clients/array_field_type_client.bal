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
import ballerina/grpc;
import ballerina/io;

HelloWorldBlockingClient HelloWorldBlockingEp = new ({
    url:"http://localhost:9092"
});

function testIntArrayInput(TestInt req) returns (int|string) {
    io:println("testIntArrayInput: input:");
    io:println(req);
    (int, grpc:Headers)|error unionResp = HelloWorldBlockingEp->testIntArrayInput(req);
    io:println(unionResp);
    if (unionResp is error) {
        io:println("Error from Connector: " + unionResp.reason());
        return "Error from Connector: " + unionResp.reason();
    } else {
        io:println("Client Got Response : ");
        int result = 0;
        (result, _) = unionResp;
        io:println(result);
        return result;
    }
}

function testStringArrayInput(TestString req) returns (string) {
    io:println("testStringArrayInput: input:");
    io:println(req);
    (string, grpc:Headers)|error unionResp = HelloWorldBlockingEp->testStringArrayInput(req);
    io:println(unionResp);
    if (unionResp is error) {
        io:println("Error from Connector: " + unionResp.reason());
        return "Error from Connector: " + unionResp.reason();
    } else {
        io:println("Client Got Response : ");
        string result;
        (result, _) = unionResp;
        io:println(result);
        return result;
    }
}

function testFloatArrayInput(TestFloat req) returns (float|string) {
    io:println("testFloatArrayInput: input:");
    io:println(req);
    (float, grpc:Headers)|error unionResp = HelloWorldBlockingEp->testFloatArrayInput(req);
    io:println(unionResp);
    if (unionResp is error) {
        io:println("Error from Connector: " + unionResp.reason());
        return "Error from Connector: " + unionResp.reason();
    } else {
        io:println("Client Got Response : ");
        float result;
        (result, _) = unionResp;
        io:println(result);
        return result;
    }
}

function testBooleanArrayInput(TestBoolean req) returns (boolean|string) {
    io:println("testBooleanArrayInput: input:");
    io:println(req);
    (boolean, grpc:Headers)|error unionResp = HelloWorldBlockingEp->testBooleanArrayInput(req);
    io:println(unionResp);
    if (unionResp is error) {
        io:println("Error from Connector: " + unionResp.reason());
        return "Error from Connector: " + unionResp.reason();
    } else {
        io:println("Client Got Response : ");
        boolean result;
        (result, _) = unionResp;
        io:println(result);
        return result;
    }
}

function testStructArrayInput(TestStruct req) returns (string) {
    io:println("testStructArrayInput: input:");
    io:println(req);
    (string, grpc:Headers)|error unionResp = HelloWorldBlockingEp->testStructArrayInput(req);
    io:println(unionResp);
    if (unionResp is error) {
        io:println("Error from Connector: " + unionResp.reason());
        return "Error from Connector: " + unionResp.reason();
    } else {
        io:println("Client Got Response : ");
        string result;
        (result, _) = unionResp;
        io:println(result);
        return result;
    }
}

function testIntArrayOutput() returns (TestInt|string) {
    io:println("testIntArrayOutput: No input:");
    (TestInt, grpc:Headers)|error unionResp = HelloWorldBlockingEp->testIntArrayOutput();
    io:println(unionResp);
    if (unionResp is error) {
        io:println("Error from Connector: " + unionResp.reason());
        return "Error from Connector: " + unionResp.reason();
    } else {
        io:println("Client Got Response : ");
        TestInt result;
        (result, _) = unionResp;
        io:println(result);
        return result;
    }
}

function testStringArrayOutput() returns (TestString|string) {
    io:println("testStringArrayOutput: No input:");
    (TestString, grpc:Headers)|error unionResp = HelloWorldBlockingEp->testStringArrayOutput();
    io:println(unionResp);
    if (unionResp is error) {
        io:println("Error from Connector: " + unionResp.reason());
        return "Error from Connector: " + unionResp.reason();
    } else {
        io:println("Client Got Response : ");
        TestString result;
        (result, _) = unionResp;
        io:println(result);
        return result;
    }
}

function testFloatArrayOutput() returns (TestFloat|string) {
    io:println("testFloatArrayOutput: No input:");
    (TestFloat, grpc:Headers)|error unionResp = HelloWorldBlockingEp->testFloatArrayOutput();
    io:println(unionResp);
    if (unionResp is error) {
        io:println("Error from Connector: " + unionResp.reason());
        return "Error from Connector: " + unionResp.reason();
    } else {
        io:println("Client Got Response : ");
        TestFloat result;
        (result, _) = unionResp;
        io:println(result);
        return result;
    }
}

function testBooleanArrayOutput() returns (TestBoolean|string) {
    io:println("testBooleanArrayOutput: No input:");
    (TestBoolean, grpc:Headers)|error unionResp = HelloWorldBlockingEp->testBooleanArrayOutput();
    io:println(unionResp);
    if (unionResp is error) {
        io:println("Error from Connector: " + unionResp.reason());
        return "Error from Connector: " + unionResp.reason();
    } else {
        io:println("Client Got Response : ");
        TestBoolean result;
        (result, _) = unionResp;
        io:println(result);
        return result;
    }
}

function testStructArrayOutput() returns (TestStruct|string) {
    io:println("testStructArrayOutput: No input:");
    (TestStruct, grpc:Headers)|error unionResp = HelloWorldBlockingEp->testStructArrayOutput();
    io:println(unionResp);
    if (unionResp is error) {
        io:println("Error from Connector: " + unionResp.reason());
        return "Error from Connector: " + unionResp.reason();
    } else {
        io:println("Client Got Response : ");
        TestStruct result;
        (result, _) = unionResp;
        io:println(result);
        return result;
    }
}

public type HelloWorldBlockingClient client object {

    private grpc:Client grpcClient = new;

    function __init(grpc:ClientEndpointConfig config) {
        // initialize client endpoint.
        grpc:Client c = new;
        c.init(config);
        error? result = c.initStub("blocking", DESCRIPTOR_KEY, descriptorMap);
        if (result is error) {
            panic result;
        } else {
            self.grpcClient = c;
        }
    }

    remote function testIntArrayInput(TestInt req, grpc:Headers? headers = ()) returns ((int, grpc:Headers)|error) {
        (any, grpc:Headers) payload = check self.grpcClient->blockingExecute("grpcservices.HelloWorld3/testIntArrayInput", req, headers = headers);
        any result = ();
        grpc:Headers resHeaders = new;
        (result, resHeaders) = payload;
        return (check <int>result, resHeaders);
    }

    remote function testStringArrayInput(TestString req, grpc:Headers? headers = ()) returns ((string, grpc:Headers)|error) {
        (any, grpc:Headers) payload = check self.grpcClient->blockingExecute("grpcservices.HelloWorld3/testStringArrayInput", req, headers = headers);
        any result = ();
        grpc:Headers resHeaders = new;
        (result, resHeaders) = payload;
        return (<string>result, resHeaders);
    }

    remote function testFloatArrayInput(TestFloat req, grpc:Headers? headers = ()) returns ((float, grpc:Headers)|error) {
        (any, grpc:Headers) payload = check self.grpcClient->blockingExecute("grpcservices.HelloWorld3/testFloatArrayInput", req, headers = headers);
        any result = ();
        grpc:Headers resHeaders = new;
        (result, resHeaders) = payload;
        return (check <float>result, resHeaders);
    }

    remote function testBooleanArrayInput(TestBoolean req, grpc:Headers? headers = ()) returns ((boolean, grpc:Headers)|error) {
        (any, grpc:Headers) payload = check self.grpcClient->blockingExecute("grpcservices.HelloWorld3/testBooleanArrayInput", req, headers = headers);
        any result = ();
        grpc:Headers resHeaders = new;
        (result, resHeaders) = payload;
        return (check <boolean>result, resHeaders);
    }

    remote function testStructArrayInput(TestStruct req, grpc:Headers? headers = ()) returns ((string, grpc:Headers)|error) {
        (any, grpc:Headers) payload = check self.grpcClient->blockingExecute("grpcservices.HelloWorld3/testStructArrayInput", req, headers = headers);
        any result = ();
        grpc:Headers resHeaders = new;
        (result, resHeaders) = payload;
        return (<string>result, resHeaders);
    }

    remote function testIntArrayOutput(grpc:Headers? headers = ()) returns ((TestInt, grpc:Headers)|error) {
        Empty req = {};
        (any, grpc:Headers) payload = check self.grpcClient->blockingExecute("grpcservices.HelloWorld3/testIntArrayOutput", req, headers = headers);
        any result =();
        grpc:Headers resHeaders = new;
        (result, resHeaders) = payload;
        return (check <TestInt>result, resHeaders);
    }

    remote function testStringArrayOutput(grpc:Headers? headers = ()) returns ((TestString, grpc:Headers)|error) {
        Empty req = {};
        (any, grpc:Headers) payload = check self.grpcClient->blockingExecute("grpcservices.HelloWorld3/testStringArrayOutput", req, headers = headers);
        any result = ();
        grpc:Headers resHeaders = new;
        (result, resHeaders) = payload;
        return (check <TestString>result, resHeaders);
    }

    remote function testFloatArrayOutput(grpc:Headers? headers = ()) returns ((TestFloat, grpc:Headers)|error) {
        Empty req = {};
        (any, grpc:Headers) payload = check self.grpcClient->blockingExecute("grpcservices.HelloWorld3/testFloatArrayOutput", req, headers = headers);
        any result = ();
        grpc:Headers resHeaders = new;
        (result, resHeaders) = payload;
        return (check <TestFloat>result, resHeaders);
    }

    remote function testBooleanArrayOutput(grpc:Headers? headers = ()) returns ((TestBoolean, grpc:Headers)|error) {
        Empty req = {};
        (any, grpc:Headers) payload = check self.grpcClient->blockingExecute("grpcservices.HelloWorld3/testBooleanArrayOutput", req, headers = headers);
        any result = ();
        grpc:Headers resHeaders = new;
        (result, resHeaders) = payload;
        return (check <TestBoolean>result, resHeaders);
    }

    remote function testStructArrayOutput(grpc:Headers? headers = ()) returns ((TestStruct, grpc:Headers)|error) {
        Empty req = {};
        (any, grpc:Headers) payload = check self.grpcClient->blockingExecute("grpcservices.HelloWorld3/testStructArrayOutput", req, headers = headers);
        any result = ();
        grpc:Headers resHeaders = new;
        (result, resHeaders) = payload;
        return (check <TestStruct>result, resHeaders);
    }
};

public type HelloWorldClient client object {

    private grpc:Client grpcClient = new;

    function __init(grpc:ClientEndpointConfig config) {
        // initialize client endpoint.
        grpc:Client c = new;
        c.init(config);
        error? result = c.initStub("non-blocking", DESCRIPTOR_KEY, descriptorMap);
        if (result is error) {
            panic result;
        } else {
            self.grpcClient = c;
        }
    }

    remote function testIntArrayInput(TestInt req, service msgListener, grpc:Headers? headers = ()) returns (error?) {
        return self.grpcClient->nonBlockingExecute("grpcservices.HelloWorld3/testIntArrayInput", req, msgListener, headers = headers);
    }

    remote function testStringArrayInput(TestString req, service msgListener, grpc:Headers? headers = ()) returns (error?) {
        return self.grpcClient->nonBlockingExecute("grpcservices.HelloWorld3/testStringArrayInput", req, msgListener, headers = headers);
    }

    remote function testFloatArrayInput(TestFloat req, service msgListener, grpc:Headers? headers = ()) returns (error?) {
        return self.grpcClient->nonBlockingExecute("grpcservices.HelloWorld3/testFloatArrayInput", req, msgListener, headers = headers);
    }

    remote function testBooleanArrayInput(TestBoolean req, service msgListener, grpc:Headers? headers = ()) returns (error?) {
        return self.grpcClient->nonBlockingExecute("grpcservices.HelloWorld3/testBooleanArrayInput", req, msgListener, headers = headers);
    }

    remote function testStructArrayInput(TestStruct req, service msgListener, grpc:Headers? headers = ()) returns (error?) {
        return self.grpcClient->nonBlockingExecute("grpcservices.HelloWorld3/testStructArrayInput", req, msgListener, headers = headers);
    }

    remote function testIntArrayOutput(service msgListener, grpc:Headers? headers = ()) returns (error?) {
        Empty req = {};
        return self.grpcClient->nonBlockingExecute("grpcservices.HelloWorld3/testIntArrayOutput", req, msgListener, headers = headers);
    }

    remote function testStringArrayOutput(service msgListener, grpc:Headers? headers = ()) returns (error?) {
        Empty req = {};
        return self.grpcClient->nonBlockingExecute("grpcservices.HelloWorld3/testStringArrayOutput", req, msgListener, headers = headers);
    }

    remote function testFloatArrayOutput(service msgListener, grpc:Headers? headers = ()) returns (error?) {
        Empty req = {};
        return self.grpcClient->nonBlockingExecute("grpcservices.HelloWorld3/testFloatArrayOutput", req, msgListener, headers = headers);
    }

    remote function testBooleanArrayOutput(service msgListener, grpc:Headers? headers = ()) returns (error?) {
        Empty req = {};
        return self.grpcClient->nonBlockingExecute("grpcservices.HelloWorld3/testBooleanArrayOutput", req, msgListener, headers = headers);
    }

    remote function testStructArrayOutput(service msgListener, grpc:Headers? headers = ()) returns (error?) {
        Empty req = {};
        return self.grpcClient->nonBlockingExecute("grpcservices.HelloWorld3/testStructArrayOutput", req, msgListener, headers = headers);
    }
};


type TestInt record {
    int[] values = [];

};

type TestString record {
    string[] values = [];

};

type TestFloat record {
    float[] values = [];

};

type TestBoolean record {
    boolean[] values = [];

};

type TestStruct record {
    A[] values = [];

};

type A record {
    string name = "";

};

type Empty record {

};


const string DESCRIPTOR_KEY = "HelloWorld3.proto";
map<any> descriptorMap =
{
    "HelloWorld3.proto":"0A1148656C6C6F576F726C64332E70726F746F120C6772706373657276696365731A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F1A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F22210A0754657374496E7412160A0676616C756573180120032803520676616C75657322240A0A54657374537472696E6712160A0676616C756573180120032809520676616C75657322230A0954657374466C6F617412160A0676616C756573180120032802520676616C75657322250A0B54657374426F6F6C65616E12160A0676616C756573180120032808520676616C75657322350A0A5465737453747275637412270A0676616C75657318012003280B320F2E6772706373657276696365732E41520676616C75657322170A014112120A046E616D6518012001280952046E616D653284060A0B48656C6C6F576F726C643312470A1174657374496E744172726179496E70757412152E6772706373657276696365732E54657374496E741A1B2E676F6F676C652E70726F746F6275662E496E74363456616C7565124E0A1474657374537472696E674172726179496E70757412182E6772706373657276696365732E54657374537472696E671A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565124B0A1374657374466C6F61744172726179496E70757412172E6772706373657276696365732E54657374466C6F61741A1B2E676F6F676C652E70726F746F6275662E466C6F617456616C7565124E0A1574657374426F6F6C65616E4172726179496E70757412192E6772706373657276696365732E54657374426F6F6C65616E1A1A2E676F6F676C652E70726F746F6275662E426F6F6C56616C7565124E0A14746573745374727563744172726179496E70757412182E6772706373657276696365732E546573745374727563741A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512430A1274657374496E7441727261794F757470757412162E676F6F676C652E70726F746F6275662E456D7074791A152E6772706373657276696365732E54657374496E7412490A1574657374537472696E6741727261794F757470757412162E676F6F676C652E70726F746F6275662E456D7074791A182E6772706373657276696365732E54657374537472696E6712470A1474657374466C6F617441727261794F757470757412162E676F6F676C652E70726F746F6275662E456D7074791A172E6772706373657276696365732E54657374466C6F6174124B0A1674657374426F6F6C65616E41727261794F757470757412162E676F6F676C652E70726F746F6275662E456D7074791A192E6772706373657276696365732E54657374426F6F6C65616E12490A157465737453747275637441727261794F757470757412162E676F6F676C652E70726F746F6275662E456D7074791A182E6772706373657276696365732E54657374537472756374620670726F746F33",
    
    "google/protobuf/wrappers.proto":
    "0A0E77726170706572732E70726F746F120F676F6F676C652E70726F746F62756622230A0B446F75626C6556616C756512140A0576616C7565180120012801520576616C756522220A0A466C6F617456616C756512140A0576616C7565180120012802520576616C756522220A0A496E74363456616C756512140A0576616C7565180120012803520576616C756522230A0B55496E74363456616C756512140A0576616C7565180120012804520576616C756522220A0A496E74333256616C756512140A0576616C7565180120012805520576616C756522230A0B55496E74333256616C756512140A0576616C756518012001280D520576616C756522210A09426F6F6C56616C756512140A0576616C7565180120012808520576616C756522230A0B537472696E6756616C756512140A0576616C7565180120012809520576616C756522220A0A427974657356616C756512140A0576616C756518012001280C520576616C756542570A13636F6D2E676F6F676C652E70726F746F627566420D577261707065727350726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33",

    "google/protobuf/empty.proto":
    "0A0B656D7074792E70726F746F120F676F6F676C652E70726F746F62756622070A05456D70747942540A13636F6D2E676F6F676C652E70726F746F627566420A456D70747950726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33"

};
