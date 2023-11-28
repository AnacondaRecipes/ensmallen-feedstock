mkdir -p build
pushd build

cmake ${CMAKE_ARGS} -G "${CMAKE_GENERATOR}" \
      -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      -DCMAKE_PREFIX_PATH=${PREFIX} \
      ..

make -j${CPU_COUNT}
make ensmallen_tests -j${CPU_COUNT}
make install

./ensmallen_tests --durations yes
