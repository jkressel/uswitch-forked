#define sandbox_fields_reflection_testlib_class_testStruct(f, g, ...) \
	f(unsigned long, fieldLong, FIELD_NORMAL, ##__VA_ARGS__) \
	g() \
	f(const char*, fieldString, FIELD_NORMAL, ##__VA_ARGS__) \
	g() \
	f(unsigned int, fieldBool, FIELD_NORMAL, ##__VA_ARGS__) \
	g() \
	f(char[8], fieldFixedArr, FIELD_NORMAL, ##__VA_ARGS__) \
	g() \
	f(int (*)(unsigned, const char*, unsigned[1]), fieldFnPtr, FIELD_NORMAL, ##__VA_ARGS__) \
	g() \
	f(struct unknownClass*, fieldUnknownPtr, FIELD_NORMAL, ##__VA_ARGS__) \
	g() \
	f(void*, voidPtr, FIELD_NORMAL, ##__VA_ARGS__) \
	g() \
	f(int (*[4])(unsigned, const char*, unsigned[1]), fnArray, FIELD_NORMAL, ##__VA_ARGS__) \
	g()

#define sandbox_fields_reflection_testlib_class_frozenStruct(f, g, ...) \
	f(int, normalField, FIELD_NORMAL, ##__VA_ARGS__) \
	g() \
	f(int, fieldForFreeze, FIELD_FREEZABLE, ##__VA_ARGS__) \
	g() \
	f(struct frozenStructTest*, next, FIELD_NORMAL, ##__VA_ARGS__) \
	g()

#define sandbox_fields_reflection_testlib_class_pointersStruct(f, g, ...) \
	f(char*, firstPointer, FIELD_NORMAL, ##__VA_ARGS__) \
	g() \
	f(char*[4], pointerArray, FIELD_NORMAL, ##__VA_ARGS__) \
	g() \
	f(char*, lastPointer, FIELD_NORMAL, ##__VA_ARGS__) \
	g()

#define sandbox_fields_reflection_testlib_allClasses(f, ...) \
	f(testStruct, testlib, ##__VA_ARGS__) \
	f(frozenStruct, testlib, ##__VA_ARGS__) \
	f(pointersStruct, testlib, ##__VA_ARGS__)
