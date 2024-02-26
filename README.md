# Soulbound token (ERC721)

- In the first case, I override the functions of the libraries to achieve compatibility with the ERC721 standard. I took two libraries as a basis: [OpenZeppelin v5.0.1](https://github.com/OpenZeppelin/openzeppelin-contracts/) and [Solmate v6.2.0](https://github.com/transmissions11/solmate). Added storage URI to Solmate libraries

- In the second case, I cut out the code unnecessary for SBT, while maintaining compatibility with ERC721.

# Gas used

Used HardHat test without optimization

<table>
    <thead>
        <tr>
            <th></th>
            <th colspan="2" align="center">OpenZeppelin</th>
            <th colspan="2" align="center">Solmate</th>
        </tr>
        <tr>
            <th></th>
            <th align="center">deploy</th>
            <th align="center">mint</th>
            <th align="center">deploy</th>
            <th align="center">mint</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="center"><strong>Cut</strong></td>
            <td align="center">1 916 164</td>
            <td align="center">118 804</td>
            <td align="center">1 418 790</td>
            <td align="center">117 268</td>
        </tr>
        <tr>
            <td align="center"><strong>Overridden</strong></td>
            <td align="center">2 232 228</td>
            <td align="center">118 874</td>
            <td align="center">2 018 090</td>
            <td align="center">117 246</td>
        </tr>
    </tbody>

</table>

Used HardHat test with optimization (200 runs)

<table>
    <thead>
        <tr>
            <th></th>
            <th colspan="2" align="center">OpenZeppelin</th>
            <th colspan="2" align="center">Solmate</th>
        </tr>
        <tr>
            <th></th>
            <th align="center">deploy</th>
            <th align="center">mint</th>
            <th align="center">deploy</th>
            <th align="center">mint</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="center"><strong>Cut</strong></td>
            <td align="center">1 051 973</td>
            <td align="center">117 641</td>
            <td align="center">738 332</td>
            <td align="center">116 294</td>
        </tr>
        <tr>
            <td align="center"><strong>Overridden</strong></td>
            <td align="center">1 236 910</td>
            <td align="center">117 717</td>
            <td align="center">1 078 246</td>
            <td align="center">116 272</td>
        </tr>
    </tbody>

</table>
