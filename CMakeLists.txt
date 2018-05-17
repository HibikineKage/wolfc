cmake_minimum_required(VERSION 2.8)
#add_executable(build/wolfc wolfc.cpp)

SET(CMAKE_CXX_FLAGS "-Wall -W -std=c++14")

FIND_PACKAGE(BISON REQUIRED)
SET(BisonOutput ${CMAKE_SOURCE_DIR}/src/parser.cpp)
IF(BISON_FOUND)
    ADD_CUSTOM_COMMAND(
      OUTPUT ${BisonOutput}
      COMMAND ${BISON_EXECUTABLE}
              --output=${BisonOutput}
              ${CMAKE_SOURCE_DIR}/src/wolfc.y
      COMMENT "Generating parser.cpp"
    )
ENDIF()

FIND_PACKAGE(FLEX REQUIRED)
SET(FlexOutput ${CMAKE_SOURCE_DIR}/src/scanner.cpp)
IF(FLEX_FOUND)
    ADD_CUSTOM_COMMAND(
      OUTPUT ${FlexOutput}
      COMMAND ${FLEX_EXECUTABLE}
              --outfile=${FlexOutput}
              ${CMAKE_SOURCE_DIR}/src/wolfc.l
      COMMENT "Generating scanner.cpp"
    )
ENDIF()

ADD_EXECUTABLE(build/wolfc src/scanner.cpp src/parser.cpp)

#ADD_LIBRARY(MyLib ${BisonOutput} ${FlexOutput})

# ソリューションファイルの名前を指定する
#project( aviDetector )

# 次の行を追加するとMinSizeRelとRelWithDebInfoの選択肢を生成することが抑制できます。
#SET(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "limited configs" FORCE)

#次の行を追加すると-DWITH_SOMELIBをコンパイルオプション指定できる。
#add_definitions(-DWITH_SOMELIB)

# OpenCVのパッケージを探す
#find_package(OpenCV REQUIRED)

#find_package(PythonLibs REQUIRED)

# OpenCVが見つかった場合のみ設定を行う
#if(OpenCV_FOUND)
  # インクルードパスを指定
  #include_directories(${OpenCV_INCLUDE_DIRS} ${PYTHON_INCLUDE_DIRS})

  # リンクするライブラリ指定
  #target_link_libraries(aviDetector ${OpenCV_LIBS} ${PYTHON_LIBRARIES})
#endif(OpenCV_FOUND)