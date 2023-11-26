#MakeFile

#通用配置参数
target := MyApp
cxx := g++
cc := gcc

config := -lpthread -ldl -lm -std=c++11 -g

#执行文件路径
BIN_PATH := $(CURDIR)
OBJ_PATH := $(CURDIR)/obj

###################################### CPP ######################################
#头文件路径
CXX_INC_PATH += ./app/inc
CXX_INC_PATH += ./component/common/inc
#头文件编译配置
CXX_INC_CONFIG += $(foreach dir, $(CXX_INC_PATH), -I $(dir))
#源文件路径
CXX_SRC_PATH += ./app/src
#源文件
CXX_SRC += $(foreach dir, $(CXX_SRC_PATH), $(wildcard $(dir)/*.cpp))
#目标文件
CXX_OBJ += $(patsubst %.cpp, %.o, $(CXX_SRC))

###################################### LIB ######################################
#库文件头文件路径
LIB_INC_PATH += ./lib
#库文件头文件编译配置
LIB_INC_CONFIG += $(foreach dir, $(LIB_INC_PATH), -I $(dir))
#库文件路径
LIB_PATH += ./lib
#库文件编译配置
LIB_CONFIG += $(foreach dir, $(LIB_PATH), -L $(dir))
#LIB += $(foreach dir, $(LIB_PATH), $(wildcard $(dir)/*.a))
#LIB += $(foreach dir, $(LIB_PATH), $(wildcard $(dir)/*.so))
#库文件
LIB += 

$(BIN_PATH)/$(target):$(C_OBJ) $(CXX_OBJ)
	$(cxx) $^ $(LIB) $(LIB_CONFIG) $(config) -o $@
	mv $^ $(OBJ_PATH)

%.o:%.cpp
	$(cxx) $(CXX_INC_CONFIG) $(C_INC_CONFIG) $(LIB_INC_CONFIG) $(config) -c $< -o $@

# %.o:%.c
# 	$(cc) $(C_INC_CONFIG) $(LIB_INC_CONFIG) $(config) -c $< -o $@

.phony:clean print

print:
	@echo
	@echo CXX_INC_PATH: $(CXX_INC_PATH)
	@echo CXX_INC_CONFIG: $(CXX_INC_CONFIG)
	@echo CXX_SRC_PATH: $(CXX_SRC_PATH)
	@echo CXX_SRC: $(CXX_SRC)
	@echo CXX_OBJ: $(CXX_OBJ)
	@echo
	@echo LIB_INC_PATH: $(LIB_INC_PATH)
	@echo LIB_INC_CONFIG: $(LIB_INC_CONFIG)
	@echo LIB_PATH: $(LIB_PATH)
	@echo LIB_CONFIG: $(LIB_CONFIG)
	@echo LIB: $(LIB)
	@echo
	@echo BIN_PATH: $(BIN_PATH)
	@echo BIN_PATH/target: $(BIN_PATH)/$(target)

clean:
	rm -f $(OBJ_PATH)/*.o
	rm -f $(BIN_PATH)/$(target)