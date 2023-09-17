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
LIMITE_SAQUES = 3

while True:

    opcao = input(menu)

    if opcao == "d":
        deposito = float(input("Valor: "))
        if deposito > 0:
            saldo += deposito
            deposito = f"{deposito:.2f}".replace(".",",")
            extrato += f"Deposito - Valor: R$ {deposito} \n"
        else:
            print("Deposito inválido.")
        print("Depósito")

    elif opcao == "s":
        if numero_saques >= LIMITE_SAQUES:
            print("Limite de saques diário atingido.")
            continue

        saque = float(input("Valor para saque: "))
        if saque > 500:
            print("O valor do saque é maior que o limite máximo de R$ 500,00")
            continue

        if saque < 0:
            print("Operação inválida.")
        if saque > saldo:
            print("Saldo insuficiente.")
        else:
            saldo -= saque
            saque = f"{saque:.2f}".replace(".",",")
            extrato += f"Saque - Valor: R$ {saque} \n"
            print(f"Saque de R$ {saque} realizado com sucesso.")
            numero_saques += 1

    elif opcao == "e":
        if extrato != "":
            print(extrato)
            saldo_str = f"{saldo:.2f}".replace(".",",")
            print(f"Saldo Atual: R$ {saldo_str}")
        else:
            print("Não foram realizadas movimentações")

    elif opcao == "q":
        break

    else:
        print("Operação inválida, por favor selecione novamente a operação desejada.")
    