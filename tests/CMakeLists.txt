# Distributed under the MIT License (See accompanying file /LICENSE)
# CMake build : tweedledum library tests
include_directories(catch2)

set(tweedledum_tests_files
    ${CMAKE_CURRENT_SOURCE_DIR}/run_tests.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/base/base.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Generators/adder.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Generators/less_than.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/IR/Cbit.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/IR/Circuit.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/IR/Instruction.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/IR/Qubit.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Operators/Unitary.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Parser/qasm.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Parser/tfc.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Analysis/compute_alap_layers.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Analysis/compute_asap_layers.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Analysis/compute_critical_paths.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Analysis/compute_cuts.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Analysis/count_operators.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Decomposition/barenco_decomp.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Decomposition/bridge_decomp.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Decomposition/one_qubit_decomp.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Mapping/Placer/ApprxSatPlacer.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Mapping/Placer/LinePlacer.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Mapping/Placer/RandomPlacer.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Mapping/Placer/SatPlacer.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Mapping/Placer/TrivialPlacer.cpp
    # ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Mapping/sat_map.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Mapping/jit_map.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Mapping/sabre_map.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Optimization/gate_cancellation.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Optimization/phase_folding.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Simulation/simulate_classically.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Passes/Utility/inverse.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Synthesis/a_star_swap_synth.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Synthesis/all_linear_synth.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Synthesis/cx_dihedral_synth.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Synthesis/decomp_synth.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Synthesis/diagonal_synth.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Synthesis/gray_synth.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Synthesis/linear_synth.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Synthesis/pkrm_synth.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Synthesis/pprm_synth.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Synthesis/sat_linear_synth.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Synthesis/sat_swap_synth.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Synthesis/spectrum_synth.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Synthesis/steiner_gauss_synth.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Synthesis/transform_synth.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Synthesis/xag_synth.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Utils/BMatrix.cpp
)

get_filename_component(TEST_QASM_DIR qasm ABSOLUTE)
add_compile_definitions(TEST_QASM_DIR="${TEST_QASM_DIR}")

add_executable(run_tests ${tweedledum_tests_files})
target_link_libraries(run_tests PUBLIC
    tweedledum
    $<$<AND:$<BOOL:${TWEEDLEDUM_ENABLE_COVERAGE}>,$<CXX_COMPILER_ID:GNU>>:gcov>
)
