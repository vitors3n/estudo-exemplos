def sacar(*, saldo, valor, extrato, limite, numero_saques, limite_saques):
    if numero_saques >= limite_saques:
        print("Limite de saques diário atingido.")
        return 0
    if valor > limite:
        print("O valor do saque é maior que o limite máximo")
        return 0
    if valor < 0:
        print("Operação inválida.")
        return 0
    if valor > saldo:
        print("Saldo insuficiente.")
        return 0
    else:
        saldo -= valor
        valor = f"{valor:.2f}".replace(".",",")
        extrato += f"Saque - Valor: R$ {valor} \n"
        print(f"Saque de R$ {valor} realizado com sucesso.")

        numero_saques += 1
    return saldo, extrato, numero_saques

def depositar(saldo, valor, extrato, /):
    if valor > 0:
        saldo += valor
        valor = f"{valor:.2f}".replace(".",",")
        extrato += f"Deposito - Valor: R$ {valor} \n"
        return (saldo, extrato)
    else:
        print("Deposito inválido.")
    return saldo, extrato
    
def retirar_extrato(saldo, /, *, extrato):
    if extrato != "":
        print(extrato)
        saldo_str = f"{saldo:.2f}".replace(".",",")
        print(f"Saldo Atual: R$ {saldo_str}")
    else:
        print("Não foram realizadas movimentações")
    
    pass

def criar_usuario(usuarios):
    cpf = input("Informe CPF (somente número): ")
    
    usuario = filtrar_usuario(cpf, usuarios)
    if usuario: 
        print("Usuário já existe")
        return

    nome = input("Informe o nome completo: ") 
    data_nascimento = input("Informe a data de nascimento (dd-mm-aaaa): ")
    endereco = input("Informe o endereço (logradouro, nro - bairro - cidade/sigla estado): ")
    
    usuarios.append({ "nome": nome, "data_nascimento": data_nascimento, "cpf": cpf, "endereco": endereco })
    
    print("Usuário criado com sucesso!")
    
def criar_conta(agencia, numero_conta, usuarios):
    cpf = input("Informe o CPF do usuário: ")
    usuario = filtrar_usuario(cpf, usuarios)

    if usuario:
        print("\n Conta criada com sucesso!")
        return {"agencia": agencia, "numero_conta": numero_conta, "usuario": usuario}
    
    print(" Usuário não encontrado, fluxo de criação de conta encerrado!")

def listar_contas(contas):
    for conta in contas:
        linha = f"""\
            Agência:\t{conta["agencia"]}
            C/C:\t\t{conta["numero_conta"]}
            Titular:\t{conta["usuario"]["nome"]}
        """
        print("*" * 100)
        print(linha)

def filtrar_usuario(cpf, usuarios):
    usuarios_filtrados = [usuario for usuario in usuarios if usuario["cpf"] == cpf]
    return usuarios_filtrados[0] if usuarios_filtrados else None

def main():

    menu = """

    [d]  Depositar
    [s]  Sacar
    [e]  Extrato
    [nu] Novo usuario
    [nc] Nova conta
    [lc] Listar contas
    [q]  Sair

    => """

    saldo = 0
    limite = 500
    extrato = ""
    numero_saques = 0
    LIMITE_SAQUES = 3
    AGENCIA = "0001"
    contas = []
    usuarios = []

    while True:

        opcao = input(menu)

        if opcao == "d":
            valor = float(input("Valor: "))
            saldo, extrato, numero_saques = depositar(saldo, valor, extrato)

        elif opcao == "s":
            valor = float(input("Valor para saque: "))
            saldo, extrato = sacar(
                saldo=saldo, 
                valor=valor, 
                extrato=extrato, 
                limite=limite, 
                numero_saques=numero_saques, 
                limite_saques=LIMITE_SAQUES
            )

        elif opcao == "e":
            retirar_extrato(saldo, extrato=extrato)
        
        elif opcao == "nu":
            criar_usuario(usuarios)

        elif opcao == "nc":
            numero_conta = len(contas) + 1
            conta = criar_conta(AGENCIA, numero_conta, usuarios)

            if conta:
                contas.append(conta)
        
        elif opcao == "lc":
            listar_contas(contas)
                
        elif opcao == "q":
            break

        else:
            print("Operação inválida, por favor selecione novamente a operação desejada.")
    
main()