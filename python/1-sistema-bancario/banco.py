menu = """

[d] Depositar
[s] Sacar
[e] Extrato
[q] Sair

=> """

saldo = 0
limite = 500
extrato = ""
numero_saques = 0
LIMITE_SAQUES = 5

while True:

    opcao = input(menu)

    if opcao == "d":
        deposito = float(input("Valor: "))
        if deposito > 0:
            saldo += deposito
            extrato += f"Deposito - Valor: R$ {deposito:.2f} \n"
        else:
            print("Deposito inválido.")
        print("Depósito")

    elif opcao == "s":
        print("Saque")

    elif opcao == "e":
        if extrato != "":
            print(extrato)
            print(f"Saldo Atual: R$ {saldo:.2f}")
        else:
            print("Não foram realizdas movimentações")

    elif opcao == "q":
        break

    else:
        print("Operação inválida, por favor selecione novamente a operação desejada.")
    