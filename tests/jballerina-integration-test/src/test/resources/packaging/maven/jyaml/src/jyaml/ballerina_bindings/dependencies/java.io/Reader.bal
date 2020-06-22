// This is an empty Ballerina object autogenerated to represent the `java.io.Reader` Java class.
//
// If you need the implementation of this class generated, please use the following command.
//
// $ ballerina bindgen [(-cp|--classpath) <classpath>...] [(-o|--output) <output>] (<class-name>...)
//
// E.g. $ ballerina bindgen java.io.Reader



# Ballerina object mapping for Java abstract class `java/io/Reader`.
#
# + _Reader - The field that represents this Ballerina object, which is used for Java subtyping.
# + _Closeable - The field that represents the superclass object `Closeable`.
# + _AutoCloseable - The field that represents the superclass object `AutoCloseable`.
# + _Readable - The field that represents the superclass object `Readable`.
# + _Object - The field that represents the superclass object `Object`.
type Reader object {

    *JObject;

    ReaderT _Reader = ReaderT;
    CloseableT _Closeable = CloseableT;
    AutoCloseableT _AutoCloseable = AutoCloseableT;
    ReadableT _Readable = ReadableT;
    ObjectT _Object = ObjectT;

    # The init function of the Ballerina object mapping `java/io/Reader` Java class.
    #
    # + obj - The `handle` value containing the Java reference of the object.
    function init(handle obj) {
        self.jObj = obj;
    }

    # The function to retrieve the string value of a Ballerina object mapping a Java class.
    #
    # + return - The `string` form of the object instance.
    function toString() returns string {
        return jObjToString(self.jObj);
    }
};


