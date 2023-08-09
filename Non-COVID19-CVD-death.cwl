cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  hypertensive-non-covid19-cvd-death---secondary:
    run: hypertensive-non-covid19-cvd-death---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  renal-non-covid19-cvd-death---secondary:
    run: renal-non-covid19-cvd-death---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: hypertensive-non-covid19-cvd-death---secondary/output
  non-covid19-cvd-death-angina---secondary:
    run: non-covid19-cvd-death-angina---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: renal-non-covid19-cvd-death---secondary/output
  non-covid19-cvd-death-pectoris---secondary:
    run: non-covid19-cvd-death-pectoris---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: non-covid19-cvd-death-angina---secondary/output
  non-covid19-cvd-death-forms---secondary:
    run: non-covid19-cvd-death-forms---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: non-covid19-cvd-death-pectoris---secondary/output
  non-covid19-cvd-death-unspecified---secondary:
    run: non-covid19-cvd-death-unspecified---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: non-covid19-cvd-death-forms---secondary/output
  myocardial-non-covid19-cvd-death---secondary:
    run: myocardial-non-covid19-cvd-death---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: non-covid19-cvd-death-unspecified---secondary/output
  ischaemic-non-covid19-cvd-death---secondary:
    run: ischaemic-non-covid19-cvd-death---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: myocardial-non-covid19-cvd-death---secondary/output
  non-covid19-cvd-death-heart---secondary:
    run: non-covid19-cvd-death-heart---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: ischaemic-non-covid19-cvd-death---secondary/output
  non-covid19-cvd-death-aneurysm---secondary:
    run: non-covid19-cvd-death-aneurysm---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: non-covid19-cvd-death-heart---secondary/output
  acute-non-covid19-cvd-death---secondary:
    run: acute-non-covid19-cvd-death---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: non-covid19-cvd-death-aneurysm---secondary/output
  noncovid19-cvd-death---secondary:
    run: noncovid19-cvd-death---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: acute-non-covid19-cvd-death---secondary/output
  non-covid19-cvd-death-failure---secondary:
    run: non-covid19-cvd-death-failure---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: noncovid19-cvd-death---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: non-covid19-cvd-death-failure---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
