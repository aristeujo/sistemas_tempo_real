### Programação sequencial
Vantagens:

    Simplicidade na implementação e entendimento.
    Facilidade para depuração, pois todas as operações seguem uma ordem fixa.
    Não requer gerenciadores de concorrência.

Desvantagens:

    Ineficiência: os processos são executados sequencialmente, o que pode levar a atrasos, especialmente se houver um processo mais lento (como leitura do ADC).
    Não suporta escalabilidade, pois todos os processos compartilham o mesmo tempo de execução.

### Programação concorrente
Vantagens:

    Concorrência controlada: O uso de semáforos (protected objects) permite que várias tarefas acessem variáveis compartilhadas sem conflitos.
    Escalabilidade: Novas tarefas podem ser adicionadas facilmente para expandir as funcionalidades.
    Eficiência: As tarefas executam de forma independente e podem aproveitar processadores multicore.

Desvantagens:

    Complexidade maior: A sincronização e o controle de concorrência adicionam complexidade à implementação.
    Sobrecarga de gerenciamento: O uso de semáforos pode introduzir uma pequena sobrecarga computacional em sistemas com restrições rígidas de tempo real.