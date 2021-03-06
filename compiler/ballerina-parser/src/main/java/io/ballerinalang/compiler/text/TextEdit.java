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
package io.ballerinalang.compiler.text;

/**
 * Represents a text edit on a {@code TextDocument}.
 *
 * @since 1.3.0
 */
public class TextEdit {
    private final TextRange range;
    private final String text;

    private TextEdit(TextRange range, String text) {
        this.range = range;
        this.text = text;
    }

    public static TextEdit from(TextRange range, String text) {
        return new TextEdit(range, text);
    }

    public TextRange range() {
        return range;
    }

    public String text() {
        return text;
    }

    public String toString() {
        return range + text;
    }
}
