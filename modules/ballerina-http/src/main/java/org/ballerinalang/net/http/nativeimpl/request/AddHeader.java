/*
 *  Copyright (c) 2016, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 *  WSO2 Inc. licenses this file to you under the Apache License,
 *  Version 2.0 (the "License"); you may not use this file except
 *  in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 */

package org.ballerinalang.net.http.nativeimpl.request;

import org.ballerinalang.bre.Context;
import org.ballerinalang.model.types.TypeEnum;
import org.ballerinalang.model.values.BStruct;
import org.ballerinalang.model.values.BValue;
import org.ballerinalang.natives.AbstractNativeFunction;
import org.ballerinalang.natives.annotations.Argument;
import org.ballerinalang.natives.annotations.Attribute;
import org.ballerinalang.natives.annotations.BallerinaAnnotation;
import org.ballerinalang.natives.annotations.BallerinaFunction;
import org.ballerinalang.net.http.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.wso2.carbon.messaging.Header;
import org.wso2.carbon.transport.http.netty.message.HTTPCarbonMessage;

import java.util.ArrayList;
import java.util.List;

/**
 * Native function to add given header to carbon message.
 * ballerina.model.messages:addHeader
 */
@BallerinaFunction(
        packageName = "ballerina.lang.messages",
        functionName = "addHeader",
        args = {@Argument(name = "request", type = TypeEnum.STRUCT, structType = "Request",
                          structPackage = "ballerina.net.http"),
                @Argument(name = "key", type = TypeEnum.STRING),
                @Argument(name = "value", type = TypeEnum.STRING)},
        isPublic = true
)
@BallerinaAnnotation(annotationName = "Description", attributes = {@Attribute(name = "value",
        value = "Adds a transport header to the message") })
@BallerinaAnnotation(annotationName = "Param", attributes = {@Attribute(name = "request",
        value = "The request message") })
@BallerinaAnnotation(annotationName = "Param", attributes = {@Attribute(name = "key",
        value = "The header name") })
@BallerinaAnnotation(annotationName = "Param", attributes = {@Attribute(name = "value",
        value = "The header value") })
public class AddHeader extends AbstractNativeFunction {

    private static final Logger log = LoggerFactory.getLogger(AddHeader.class);

    @Override
    public BValue[] execute(Context context) {
        BStruct requestStruct  = ((BStruct) getRefArgument(context, 0));
        String headerName = getStringArgument(context, 0);
        String headerValue = getStringArgument(context, 1);
        // Add new header.
        HTTPCarbonMessage httpCarbonMessage = (HTTPCarbonMessage) requestStruct
                .getNativeData(Constants.TRANSPORT_MESSAGE);

        List<Header> headerList = new ArrayList<>();
        headerList.add(new Header(headerName, headerValue));
        httpCarbonMessage.setHeaders(headerList);

        if (log.isDebugEnabled()) {
            log.debug("Add " + headerName + " to header with value: " + headerValue);
        }
        return VOID_RETURN;
    }
}
