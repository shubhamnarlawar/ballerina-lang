/*
 *  Copyright (c) 2020, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 *  WSO2 Inc. licenses this file to you under the Apache License,
 *  Version 2.0 (the "License"); you may not use this file except
 *  in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 */
package io.ballerinalang.compiler.syntax.tree;

import io.ballerinalang.compiler.internal.parser.tree.STNode;

/**
 * @since 1.3.0
 */
public class ImportVersion extends NonTerminalNode {

    private Token versionKeyword;
    private Node versionNumber;

    public ImportVersion(STNode node, int position, NonTerminalNode parent) {
        super(node, position, parent);
    }

    public Token versionKeyword() {
        if (versionKeyword != null) {
            return versionKeyword;
        }

        versionKeyword = createToken(0);
        return versionKeyword;
    }

    public Node versionNumber() {
        if (versionNumber != null) {
            return versionNumber;
        }

        versionNumber = createListNode(1);
        return versionNumber;
    }

    public Node childInBucket(int bucket) {
        switch (bucket) {
            case 0:
                return versionKeyword();
            case 1:
                return versionNumber();
        }
        return null;
    }

    @Override
    public void accept(SyntaxNodeVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public <T> T apply(SyntaxNodeTransformer<T> visitor) {
        return visitor.transform(this);
    }
}