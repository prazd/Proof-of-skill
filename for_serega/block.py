import json
import os
import hashlib

#Если не было еще создано блоков - создается генезис
def genesis():
    bloc_dir = os.curdir+'/blockchain/'
    files = os.listdir(bloc_dir)
    if len(files) == 0:
        with open(bloc_dir+'1','w') as gen_block:
            data = {"name": "Serega",
        	    "amount": 0,
                "to_whom": "Leha",
                "hash": ""
        		}
            gen_block.write(str(data))
    else:
        return

#Проведение транзакций и создание следующего блока
def write_block(name, amount, to_whom):
    blockchain_dir = os.curdir + '/blockchain/'
    files = os.listdir(blockchain_dir)
    files = sorted([int(i) for i in files])
    last_file = files[-1]
    file_name = str(last_file + 1)
    #Вычисляем хэш предыдущего блока
    with open(blockchain_dir+str(last_file),'r') as last_block:
        info = last_block.read()
    l_block_hash = hashlib.md5(info.encode('utf-8')).hexdigest()

    #Записываем информацию
    data = {"name": name,
    	    "amount": amount,
            "to_whom": to_whom,
            "hash_last_block":l_block_hash,
            "hash_this_block":""
    		}
    with open(blockchain_dir + file_name, 'w') as file:
        json.dump(data, file, indent=4, ensure_ascii=False)

    #Вычисляем хэш записанного блока и добавляем в файл
    with open(blockchain_dir + file_name, 'r') as this_hash:
        read_js = json.load(this_hash)
        hash_this_b = hashlib.md5(str(read_js).encode("utf-8")).hexdigest()
        read_js['hash_this_block'] = hash_this_b
    #Записываем изменения (хэш этого блока)
    with open(blockchain_dir + file_name, 'w') as fin:
        json.dump(read_js, fin, ensure_ascii=False)

def main():
    genesis()
    a = input("Кто: ")
    b = input("Кому: ")
    c = int(input("Сколько: "))
    write_block(name = a, amount = c, to_whom = b)
   #  pass

if __name__ == '__main__':
    main()
