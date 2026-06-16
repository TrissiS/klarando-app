.class public final Lc/a/b/m/b/g;
.super Ljava/lang/Object;
.source "PDF417HighLevelEncoder.java"


# static fields
.field public static final a:[B

.field public static final b:[B

.field public static final c:[B

.field public static final d:[B

.field public static final e:Ljava/nio/charset/Charset;


# direct methods
.method public static constructor <clinit>()V
    .registers 5

    const/16 v0, 0x1e

    new-array v1, v0, [B

    .line 1
    fill-array-data v1, :array_52

    sput-object v1, Lc/a/b/m/b/g;->a:[B

    new-array v0, v0, [B

    .line 2
    fill-array-data v0, :array_66

    sput-object v0, Lc/a/b/m/b/g;->b:[B

    const/16 v0, 0x80

    new-array v1, v0, [B

    .line 3
    sput-object v1, Lc/a/b/m/b/g;->c:[B

    new-array v0, v0, [B

    .line 4
    sput-object v0, Lc/a/b/m/b/g;->d:[B

    const-string v0, "ISO-8859-1"

    .line 5
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lc/a/b/m/b/g;->e:Ljava/nio/charset/Charset;

    .line 6
    sget-object v0, Lc/a/b/m/b/g;->c:[B

    const/4 v1, -0x1

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([BB)V

    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 7
    :goto_2a
    sget-object v3, Lc/a/b/m/b/g;->a:[B

    array-length v4, v3

    if-ge v2, v4, :cond_3b

    .line 8
    aget-byte v3, v3, v2

    if-lez v3, :cond_37

    .line 9
    sget-object v4, Lc/a/b/m/b/g;->c:[B

    aput-byte v2, v4, v3

    :cond_37
    add-int/lit8 v2, v2, 0x1

    int-to-byte v2, v2

    goto :goto_2a

    .line 10
    :cond_3b
    sget-object v2, Lc/a/b/m/b/g;->d:[B

    invoke-static {v2, v1}, Ljava/util/Arrays;->fill([BB)V

    .line 11
    :goto_40
    sget-object v1, Lc/a/b/m/b/g;->b:[B

    array-length v2, v1

    if-ge v0, v2, :cond_51

    .line 12
    aget-byte v1, v1, v0

    if-lez v1, :cond_4d

    .line 13
    sget-object v2, Lc/a/b/m/b/g;->d:[B

    aput-byte v0, v2, v1

    :cond_4d
    add-int/lit8 v0, v0, 0x1

    int-to-byte v0, v0

    goto :goto_40

    :cond_51
    return-void

    :array_52
    .array-data 1
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x26t
        0xdt
        0x9t
        0x2ct
        0x3at
        0x23t
        0x2dt
        0x2et
        0x24t
        0x2ft
        0x2bt
        0x25t
        0x2at
        0x3dt
        0x5et
        0x0t
        0x20t
        0x0t
        0x0t
        0x0t
    .end array-data

    nop

    :array_66
    .array-data 1
        0x3bt
        0x3ct
        0x3et
        0x40t
        0x5bt
        0x5ct
        0x5dt
        0x5ft
        0x60t
        0x7et
        0x21t
        0xdt
        0x9t
        0x2ct
        0x3at
        0xat
        0x2dt
        0x2et
        0x24t
        0x2ft
        0x22t
        0x7ct
        0x2at
        0x28t
        0x29t
        0x3ft
        0x7bt
        0x7dt
        0x27t
        0x0t
    .end array-data
.end method

.method public static a(Ljava/lang/CharSequence;I)I
    .registers 6

    .line 91
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    if-ge p1, v0, :cond_1e

    .line 92
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .line 93
    :cond_b
    :goto_b
    invoke-static {v2}, Lc/a/b/m/b/g;->c(C)Z

    move-result v3

    if-eqz v3, :cond_1e

    if-ge p1, v0, :cond_1e

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 p1, p1, 0x1

    if-ge p1, v0, :cond_b

    .line 94
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    goto :goto_b

    :cond_1e
    return v1
.end method

.method public static a(Ljava/lang/CharSequence;IILjava/lang/StringBuilder;I)I
    .registers 21

    move-object/from16 v0, p0

    move/from16 v1, p2

    move-object/from16 v2, p3

    .line 27
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x1

    move/from16 v7, p4

    const/4 v8, 0x0

    :cond_11
    :goto_11
    add-int v9, p1, v8

    .line 28
    invoke-interface {v0, v9}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v10

    const/16 v11, 0x1a

    const/16 v12, 0x20

    const/16 v13, 0x1c

    const/16 v14, 0x1b

    const/16 v15, 0x1d

    if-eqz v7, :cond_bc

    if-eq v7, v6, :cond_83

    if-eq v7, v4, :cond_3c

    .line 29
    invoke-static {v10}, Lc/a/b/m/b/g;->e(C)Z

    move-result v9

    if-eqz v9, :cond_37

    .line 30
    sget-object v9, Lc/a/b/m/b/g;->d:[B

    aget-byte v9, v9, v10

    int-to-char v9, v9

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_f2

    .line 31
    :cond_37
    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_3a
    const/4 v7, 0x0

    goto :goto_11

    .line 32
    :cond_3c
    invoke-static {v10}, Lc/a/b/m/b/g;->d(C)Z

    move-result v11

    if-eqz v11, :cond_4c

    .line 33
    sget-object v9, Lc/a/b/m/b/g;->c:[B

    aget-byte v9, v9, v10

    int-to-char v9, v9

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_f2

    .line 34
    :cond_4c
    invoke-static {v10}, Lc/a/b/m/b/g;->b(C)Z

    move-result v11

    if-eqz v11, :cond_56

    .line 35
    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3a

    .line 36
    :cond_56
    invoke-static {v10}, Lc/a/b/m/b/g;->a(C)Z

    move-result v11

    if-eqz v11, :cond_61

    .line 37
    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_d8

    :cond_61
    add-int/lit8 v9, v9, 0x1

    if-ge v9, v1, :cond_76

    .line 38
    invoke-interface {v0, v9}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    .line 39
    invoke-static {v9}, Lc/a/b/m/b/g;->e(C)Z

    move-result v9

    if-eqz v9, :cond_76

    const/4 v7, 0x3

    const/16 v9, 0x19

    .line 40
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_11

    .line 41
    :cond_76
    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 42
    sget-object v9, Lc/a/b/m/b/g;->d:[B

    aget-byte v9, v9, v10

    int-to-char v9, v9

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_f2

    .line 43
    :cond_83
    invoke-static {v10}, Lc/a/b/m/b/g;->a(C)Z

    move-result v9

    if-eqz v9, :cond_96

    if-ne v10, v12, :cond_8f

    .line 44
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_f2

    :cond_8f
    add-int/lit8 v10, v10, -0x61

    int-to-char v9, v10

    .line 45
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_f2

    .line 46
    :cond_96
    invoke-static {v10}, Lc/a/b/m/b/g;->b(C)Z

    move-result v9

    if-eqz v9, :cond_a6

    .line 47
    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v10, v10, -0x41

    int-to-char v9, v10

    .line 48
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_f2

    .line 49
    :cond_a6
    invoke-static {v10}, Lc/a/b/m/b/g;->d(C)Z

    move-result v9

    if-eqz v9, :cond_b0

    .line 50
    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_e4

    .line 51
    :cond_b0
    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 52
    sget-object v9, Lc/a/b/m/b/g;->d:[B

    aget-byte v9, v9, v10

    int-to-char v9, v9

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_f2

    .line 53
    :cond_bc
    invoke-static {v10}, Lc/a/b/m/b/g;->b(C)Z

    move-result v9

    if-eqz v9, :cond_cf

    if-ne v10, v12, :cond_c8

    .line 54
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_f2

    :cond_c8
    add-int/lit8 v10, v10, -0x41

    int-to-char v9, v10

    .line 55
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_f2

    .line 56
    :cond_cf
    invoke-static {v10}, Lc/a/b/m/b/g;->a(C)Z

    move-result v9

    if-eqz v9, :cond_db

    .line 57
    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_d8
    const/4 v7, 0x1

    goto/16 :goto_11

    .line 58
    :cond_db
    invoke-static {v10}, Lc/a/b/m/b/g;->d(C)Z

    move-result v9

    if-eqz v9, :cond_e7

    .line 59
    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_e4
    const/4 v7, 0x2

    goto/16 :goto_11

    .line 60
    :cond_e7
    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 61
    sget-object v9, Lc/a/b/m/b/g;->d:[B

    aget-byte v9, v9, v10

    int-to-char v9, v9

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_f2
    add-int/lit8 v8, v8, 0x1

    if-lt v8, v1, :cond_11

    .line 62
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v8, 0x0

    :goto_fc
    if-ge v1, v0, :cond_11a

    .line 63
    rem-int/lit8 v9, v1, 0x2

    if-eqz v9, :cond_104

    const/4 v9, 0x1

    goto :goto_105

    :cond_104
    const/4 v9, 0x0

    :goto_105
    if-eqz v9, :cond_113

    mul-int/lit8 v8, v8, 0x1e

    .line 64
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v9

    add-int/2addr v8, v9

    int-to-char v8, v8

    .line 65
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_117

    .line 66
    :cond_113
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v8

    :goto_117
    add-int/lit8 v1, v1, 0x1

    goto :goto_fc

    .line 67
    :cond_11a
    rem-int/2addr v0, v4

    if-eqz v0, :cond_124

    mul-int/lit8 v8, v8, 0x1e

    add-int/2addr v8, v15

    int-to-char v0, v8

    .line 68
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_124
    return v7
.end method

.method public static a(Ljava/lang/String;ILjava/nio/charset/Charset;)I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    .line 95
    invoke-virtual {p2}, Ljava/nio/charset/Charset;->newEncoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object p2

    .line 96
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    move v1, p1

    :goto_9
    if-ge v1, v0, :cond_5b

    .line 97
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/4 v3, 0x0

    :goto_10
    const/16 v4, 0xd

    if-ge v3, v4, :cond_26

    .line 98
    invoke-static {v2}, Lc/a/b/m/b/g;->c(C)Z

    move-result v2

    if-eqz v2, :cond_26

    add-int/lit8 v3, v3, 0x1

    add-int v2, v1, v3

    if-lt v2, v0, :cond_21

    goto :goto_26

    .line 99
    :cond_21
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    goto :goto_10

    :cond_26
    :goto_26
    if-lt v3, v4, :cond_2a

    sub-int/2addr v1, p1

    return v1

    .line 100
    :cond_2a
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 101
    invoke-virtual {p2, v2}, Ljava/nio/charset/CharsetEncoder;->canEncode(C)Z

    move-result v3

    if-eqz v3, :cond_37

    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 102
    :cond_37
    new-instance p0, Lc/a/b/h;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Non-encodable character detected: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string p2, " (Unicode: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 p2, 0x29

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lc/a/b/h;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_5b
    sub-int/2addr v1, p1

    return v1
.end method

.method public static a(Ljava/lang/String;Lc/a/b/m/b/c;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    if-nez p2, :cond_e

    .line 2
    sget-object p2, Lc/a/b/m/b/g;->e:Ljava/nio/charset/Charset;

    goto :goto_27

    .line 3
    :cond_e
    sget-object v1, Lc/a/b/m/b/g;->e:Ljava/nio/charset/Charset;

    invoke-virtual {v1, p2}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_27

    .line 4
    invoke-virtual {p2}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lc/a/b/j/c;->getCharacterSetECIByName(Ljava/lang/String;)Lc/a/b/j/c;

    move-result-object v1

    if-eqz v1, :cond_27

    .line 5
    invoke-virtual {v1}, Lc/a/b/j/c;->getValue()I

    move-result v1

    invoke-static {v1, v0}, Lc/a/b/m/b/g;->a(ILjava/lang/StringBuilder;)V

    .line 6
    :cond_27
    :goto_27
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 7
    sget-object v2, Lc/a/b/m/b/c;->TEXT:Lc/a/b/m/b/c;

    const/4 v3, 0x0

    if-ne p1, v2, :cond_35

    .line 8
    invoke-static {p0, v3, v1, v0, v3}, Lc/a/b/m/b/g;->a(Ljava/lang/CharSequence;IILjava/lang/StringBuilder;I)I

    goto/16 :goto_a2

    .line 9
    :cond_35
    sget-object v2, Lc/a/b/m/b/c;->BYTE:Lc/a/b/m/b/c;

    const/4 v4, 0x1

    if-ne p1, v2, :cond_43

    .line 10
    invoke-virtual {p0, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    .line 11
    array-length p1, p0

    invoke-static {p0, v3, p1, v4, v0}, Lc/a/b/m/b/g;->a([BIIILjava/lang/StringBuilder;)V

    goto :goto_a2

    .line 12
    :cond_43
    sget-object v2, Lc/a/b/m/b/c;->NUMERIC:Lc/a/b/m/b/c;

    const/16 v5, 0x386

    if-ne p1, v2, :cond_50

    .line 13
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 14
    invoke-static {p0, v3, v1, v0}, Lc/a/b/m/b/g;->a(Ljava/lang/String;IILjava/lang/StringBuilder;)V

    goto :goto_a2

    :cond_50
    const/4 p1, 0x0

    const/4 v2, 0x0

    const/4 v6, 0x0

    :goto_53
    if-ge p1, v1, :cond_a2

    .line 15
    invoke-static {p0, p1}, Lc/a/b/m/b/g;->a(Ljava/lang/CharSequence;I)I

    move-result v7

    const/16 v8, 0xd

    if-lt v7, v8, :cond_68

    .line 16
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v2, 0x2

    .line 17
    invoke-static {p0, p1, v7, v0}, Lc/a/b/m/b/g;->a(Ljava/lang/String;IILjava/lang/StringBuilder;)V

    add-int/2addr p1, v7

    const/4 v2, 0x0

    const/4 v6, 0x2

    goto :goto_53

    .line 18
    :cond_68
    invoke-static {p0, p1}, Lc/a/b/m/b/g;->b(Ljava/lang/CharSequence;I)I

    move-result v8

    const/4 v9, 0x5

    if-ge v8, v9, :cond_93

    if-ne v7, v1, :cond_72

    goto :goto_93

    .line 19
    :cond_72
    invoke-static {p0, p1, p2}, Lc/a/b/m/b/g;->a(Ljava/lang/String;ILjava/nio/charset/Charset;)I

    move-result v7

    if-nez v7, :cond_79

    const/4 v7, 0x1

    :cond_79
    add-int/2addr v7, p1

    .line 20
    invoke-virtual {p0, p1, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    .line 21
    array-length v8, p1

    if-ne v8, v4, :cond_8b

    if-nez v6, :cond_8b

    .line 22
    invoke-static {p1, v3, v4, v3, v0}, Lc/a/b/m/b/g;->a([BIIILjava/lang/StringBuilder;)V

    goto :goto_91

    .line 23
    :cond_8b
    array-length v2, p1

    invoke-static {p1, v3, v2, v6, v0}, Lc/a/b/m/b/g;->a([BIIILjava/lang/StringBuilder;)V

    const/4 v2, 0x0

    const/4 v6, 0x1

    :goto_91
    move p1, v7

    goto :goto_53

    :cond_93
    :goto_93
    if-eqz v6, :cond_9c

    const/16 v2, 0x384

    .line 24
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    const/4 v6, 0x0

    .line 25
    :cond_9c
    invoke-static {p0, p1, v8, v0, v2}, Lc/a/b/m/b/g;->a(Ljava/lang/CharSequence;IILjava/lang/StringBuilder;I)I

    move-result v2

    add-int/2addr p1, v8

    goto :goto_53

    .line 26
    :cond_a2
    :goto_a2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(ILjava/lang/StringBuilder;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    const/16 v0, 0x384

    if-ltz p0, :cond_10

    if-ge p0, v0, :cond_10

    const/16 v0, 0x39f

    .line 103
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    int-to-char p0, p0

    .line 104
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_37

    :cond_10
    const v1, 0xc5f94

    if-ge p0, v1, :cond_28

    const/16 v1, 0x39e

    .line 105
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 106
    div-int/lit16 v1, p0, 0x384

    add-int/lit8 v1, v1, -0x1

    int-to-char v1, v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 107
    rem-int/2addr p0, v0

    int-to-char p0, p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_37

    :cond_28
    const v0, 0xc6318

    if-ge p0, v0, :cond_38

    const/16 v0, 0x39d

    .line 108
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    sub-int/2addr v1, p0

    int-to-char p0, v1

    .line 109
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_37
    return-void

    .line 110
    :cond_38
    new-instance p1, Lc/a/b/h;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ECI number not in valid range from 0..811799, but was "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lc/a/b/h;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static a(Ljava/lang/String;IILjava/lang/StringBuilder;)V
    .registers 13

    .line 79
    new-instance v0, Ljava/lang/StringBuilder;

    div-int/lit8 v1, p2, 0x3

    add-int/lit8 v1, v1, 0x1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-wide/16 v1, 0x384

    .line 80
    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    const-wide/16 v2, 0x0

    .line 81
    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_17
    if-ge v4, p2, :cond_6c

    .line 82
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->setLength(I)V

    const/16 v5, 0x2c

    sub-int v6, p2, v4

    .line 83
    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 84
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v7, 0x31

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int v7, p1, v4

    add-int v8, v7, v5

    invoke-virtual {p0, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 85
    new-instance v7, Ljava/math/BigInteger;

    invoke-direct {v7, v6}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 86
    :cond_42
    invoke-virtual {v7, v1}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v6}, Ljava/math/BigInteger;->intValue()I

    move-result v6

    int-to-char v6, v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 87
    invoke-virtual {v7, v1}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    .line 88
    invoke-virtual {v7, v2}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_42

    .line 89
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    :goto_5e
    if-ltz v6, :cond_6a

    .line 90
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v7

    invoke-virtual {p3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v6, v6, -0x1

    goto :goto_5e

    :cond_6a
    add-int/2addr v4, v5

    goto :goto_17

    :cond_6c
    return-void
.end method

.method public static a([BIIILjava/lang/StringBuilder;)V
    .registers 16

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p2, v1, :cond_c

    if-nez p3, :cond_c

    const/16 p3, 0x391

    .line 69
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1f

    .line 70
    :cond_c
    rem-int/lit8 p3, p2, 0x6

    if-nez p3, :cond_11

    goto :goto_12

    :cond_11
    const/4 v1, 0x0

    :goto_12
    if-eqz v1, :cond_1a

    const/16 p3, 0x39c

    .line 71
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1f

    :cond_1a
    const/16 p3, 0x385

    .line 72
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_1f
    const/4 p3, 0x6

    if-lt p2, p3, :cond_5b

    const/4 v1, 0x5

    new-array v2, v1, [C

    move v3, p1

    :goto_26
    add-int v4, p1, p2

    sub-int/2addr v4, v3

    if-lt v4, p3, :cond_5c

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    :goto_2e
    if-ge v6, p3, :cond_3e

    const/16 v7, 0x8

    shl-long/2addr v4, v7

    add-int v7, v3, v6

    .line 73
    aget-byte v7, p0, v7

    and-int/lit16 v7, v7, 0xff

    int-to-long v7, v7

    add-long/2addr v4, v7

    add-int/lit8 v6, v6, 0x1

    goto :goto_2e

    :cond_3e
    const/4 v6, 0x0

    :goto_3f
    if-ge v6, v1, :cond_4d

    const-wide/16 v7, 0x384

    .line 74
    rem-long v9, v4, v7

    long-to-int v10, v9

    int-to-char v9, v10

    aput-char v9, v2, v6

    .line 75
    div-long/2addr v4, v7

    add-int/lit8 v6, v6, 0x1

    goto :goto_3f

    :cond_4d
    const/4 v4, 0x4

    :goto_4e
    if-ltz v4, :cond_58

    .line 76
    aget-char v5, v2, v4

    invoke-virtual {p4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, -0x1

    goto :goto_4e

    :cond_58
    add-int/lit8 v3, v3, 0x6

    goto :goto_26

    :cond_5b
    move v3, p1

    :cond_5c
    :goto_5c
    add-int p3, p1, p2

    if-ge v3, p3, :cond_6b

    .line 77
    aget-byte p3, p0, v3

    and-int/lit16 p3, p3, 0xff

    int-to-char p3, p3

    .line 78
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_5c

    :cond_6b
    return-void
.end method

.method public static a(C)Z
    .registers 2

    const/16 v0, 0x20

    if-eq p0, v0, :cond_f

    const/16 v0, 0x61

    if-lt p0, v0, :cond_d

    const/16 v0, 0x7a

    if-gt p0, v0, :cond_d

    goto :goto_f

    :cond_d
    const/4 p0, 0x0

    goto :goto_10

    :cond_f
    :goto_f
    const/4 p0, 0x1

    :goto_10
    return p0
.end method

.method public static b(Ljava/lang/CharSequence;I)I
    .registers 8

    .line 1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    move v1, p1

    :goto_5
    if-ge v1, v0, :cond_39

    .line 2
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    const/4 v3, 0x0

    :cond_c
    :goto_c
    const/16 v4, 0xd

    if-ge v3, v4, :cond_23

    .line 3
    invoke-static {v2}, Lc/a/b/m/b/g;->c(C)Z

    move-result v5

    if-eqz v5, :cond_23

    if-ge v1, v0, :cond_23

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v1, v1, 0x1

    if-ge v1, v0, :cond_c

    .line 4
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    goto :goto_c

    :cond_23
    if-lt v3, v4, :cond_28

    sub-int/2addr v1, p1

    sub-int/2addr v1, v3

    return v1

    :cond_28
    if-lez v3, :cond_2b

    goto :goto_5

    .line 5
    :cond_2b
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .line 6
    invoke-static {v2}, Lc/a/b/m/b/g;->f(C)Z

    move-result v2

    if-nez v2, :cond_36

    goto :goto_39

    :cond_36
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_39
    :goto_39
    sub-int/2addr v1, p1

    return v1
.end method

.method public static b(C)Z
    .registers 2

    const/16 v0, 0x20

    if-eq p0, v0, :cond_f

    const/16 v0, 0x41

    if-lt p0, v0, :cond_d

    const/16 v0, 0x5a

    if-gt p0, v0, :cond_d

    goto :goto_f

    :cond_d
    const/4 p0, 0x0

    goto :goto_10

    :cond_f
    :goto_f
    const/4 p0, 0x1

    :goto_10
    return p0
.end method

.method public static c(C)Z
    .registers 2

    const/16 v0, 0x30

    if-lt p0, v0, :cond_a

    const/16 v0, 0x39

    if-gt p0, v0, :cond_a

    const/4 p0, 0x1

    goto :goto_b

    :cond_a
    const/4 p0, 0x0

    :goto_b
    return p0
.end method

.method public static d(C)Z
    .registers 2

    .line 1
    sget-object v0, Lc/a/b/m/b/g;->c:[B

    aget-byte p0, v0, p0

    const/4 v0, -0x1

    if-eq p0, v0, :cond_9

    const/4 p0, 0x1

    goto :goto_a

    :cond_9
    const/4 p0, 0x0

    :goto_a
    return p0
.end method

.method public static e(C)Z
    .registers 2

    .line 1
    sget-object v0, Lc/a/b/m/b/g;->d:[B

    aget-byte p0, v0, p0

    const/4 v0, -0x1

    if-eq p0, v0, :cond_9

    const/4 p0, 0x1

    goto :goto_a

    :cond_9
    const/4 p0, 0x0

    :goto_a
    return p0
.end method

.method public static f(C)Z
    .registers 2

    const/16 v0, 0x9

    if-eq p0, v0, :cond_17

    const/16 v0, 0xa

    if-eq p0, v0, :cond_17

    const/16 v0, 0xd

    if-eq p0, v0, :cond_17

    const/16 v0, 0x20

    if-lt p0, v0, :cond_15

    const/16 v0, 0x7e

    if-gt p0, v0, :cond_15

    goto :goto_17

    :cond_15
    const/4 p0, 0x0

    goto :goto_18

    :cond_17
    :goto_17
    const/4 p0, 0x1

    :goto_18
    return p0
.end method
