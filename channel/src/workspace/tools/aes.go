﻿package tools

import (
	"bytes"
	"crypto/cipher"
	"crypto/aes"
	"encoding/base64"
)


type Aes struct{
}


func (this *Aes) Encode(data ,key string)(string ,error){
	result, err := encrypt([]byte(data), []byte(key))
	if(err==nil){
		return base64.StdEncoding.EncodeToString(result),nil
	}
	return "",err
}

func (this *Aes) Decode(data ,key string)(string,error){
	mydata,err:=base64.StdEncoding.DecodeString(data);
	if(err==nil){
		origData, err := decrypt(mydata, []byte(key))
		if(err==nil){
			return string(origData),nil
		}else{
			return "",nil
		}
	}
	return "",err;
}

func main() {
	testAes()
}

func testAes() {
	//password:="sfe023f_9fd&fwfl"
	//data:="h"
	//encodedData,_:=AesEncode(data,password)
	//decodedData,_:=AesDecode(encodedData,password)
	//fmt.Println(encodedData)
	//fmt.Println(decodedData)

	/*// AES-128。key长度：16, 24, 32 bytes 对应 AES-128, AES-192, AES-256
	key := []byte("sfe023f_9fd&fwfl")
	result, err := encrypt([]byte("你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊"), key)
	if err != nil {
		panic(err)
	}

	base64Result:=base64.StdEncoding.EncodeToString(result)
	fmt.Println(base64Result)

	mydata,err:=base64.StdEncoding.DecodeString(base64Result);

	origData, err := decrypt(mydata, key)
	if err != nil {
		panic(err)
	}
	fmt.Println(string(origData))*/
}


func encrypt(origData, key []byte) ([]byte, error) {
	block, err := aes.NewCipher(key)
	if err != nil {
		return nil, err
	}
	blockSize := block.BlockSize()
	origData = pKCS5Padding(origData, blockSize)
	// origData = zeroPadding(origData, block.BlockSize())
	blockMode := cipher.NewCBCEncrypter(block, key[:blockSize])
	crypted := make([]byte, len(origData))
	// 根据CryptBlocks方法的说明，如下方式初始化crypted也可以
	// crypted := origData
	blockMode.CryptBlocks(crypted, origData)
	return crypted, nil
}

func decrypt(crypted, key []byte) ([]byte, error) {
	block, err := aes.NewCipher(key)
	if err != nil {
		return nil, err
	}
	blockSize := block.BlockSize()
	blockMode := cipher.NewCBCDecrypter(block, key[:blockSize])
	origData := make([]byte, len(crypted))
	// origData := crypted
	blockMode.CryptBlocks(origData, crypted)
	origData = pKCS5UnPadding(origData)
	// origData = zeroUnPadding(origData)
	return origData, nil
}

func zeroPadding(ciphertext []byte, blockSize int) []byte {
	padding := blockSize - len(ciphertext) % blockSize
	padtext := bytes.Repeat([]byte{0}, padding)
	return append(ciphertext, padtext...)
}

func zeroUnPadding(origData []byte) []byte {
	length := len(origData)
	unpadding := int(origData[length - 1])
	return origData[:(length-unpadding)]
}

func pKCS5Padding(ciphertext []byte, blockSize int) []byte {
	padding := blockSize - len(ciphertext) % blockSize
	padtext := bytes.Repeat([]byte{byte(padding)}, padding)
	return append(ciphertext, padtext...)
}

func pKCS5UnPadding(origData []byte) []byte {
	length := len(origData)
	// 去掉最后一个字节 unpadding 次
	unpadding := int(origData[length - 1])
	return origData[:(length-unpadding)]
}
