# VM List
%{ for node, details in nodes ~}
${details.name}: ${details.address}
%{ endfor ~}
