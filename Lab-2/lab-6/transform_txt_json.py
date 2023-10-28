import json
from unidecode import unidecode

nome_arquivo = 'estacoes-e-apeadeiros.txt'

dados = []
def limpar_texto(texto):
    texto_sem_acentos = unidecode(texto)
    return texto_sem_acentos.replace('ç', 'c')

with open(nome_arquivo, 'r', encoding='utf-8') as arquivo:
    tipos_dados = arquivo.readline().strip().split(';')

    for linha in arquivo:
        valores = linha.strip().split(';')
        dados_linha = {}

        for tipo, valor in zip(tipos_dados, valores):
            if valor == 'None':
                valor = None

            # Aplica a função de limpeza
            dados_linha[limpar_texto(tipo)] = limpar_texto(valor)

        dados.append(dados_linha)

with open('dados.json', 'w', encoding='utf-8') as arquivo_json:
    json.dump(dados, arquivo_json, ensure_ascii=False, indent=4)

print('Arquivo JSON gerado com sucesso: dados.json')
