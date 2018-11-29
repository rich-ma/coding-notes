``` javascript
function sockMerchant(n, ar) {
    let hash = {};
    let pairs = 0;
    ar.forEach(sock => {
        if (hash[sock]) {
            hash[sock] += 1;
            if (hash[sock] === 2) {
                pairs++;
                hash[sock] = 0;
            }
        } else {
            hash[sock] = 1;
        }
    })
    return pairs;
}
```

```ruby
def sockMerchant(n, ar)
    sock_hash = Hash.new(0)
    pairs = 0
    ar.each do |sock|
        sock_hash[sock] += 1
        if sock_hash[sock] == 2
            pairs += 1
            sock_hash[sock] = 0
        end
    end
    return pairs
end

```
