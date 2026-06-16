.class public final Lc/a/b/l/d;
.super Lc/a/b/l/m;
.source "Code128Writer.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lc/a/b/l/m;-><init>()V

    return-void
.end method

.method public static a(Ljava/lang/CharSequence;II)Z
    .registers 7

    add-int/2addr p2, p1

    .line 22
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    :goto_5
    const/4 v1, 0x0

    if-ge p1, p2, :cond_20

    if-ge p1, v0, :cond_20

    .line 23
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    const/16 v3, 0x30

    if-lt v2, v3, :cond_16

    const/16 v3, 0x39

    if-le v2, v3, :cond_1d

    :cond_16
    const/16 v3, 0xf1

    if-eq v2, v3, :cond_1b

    return v1

    :cond_1b
    add-int/lit8 p2, p2, 0x1

    :cond_1d
    add-int/lit8 p1, p1, 0x1

    goto :goto_5

    :cond_20
    if-gt p2, v0, :cond_23

    const/4 v1, 0x1

    :cond_23
    return v1
.end method


# virtual methods
.method public a(Ljava/lang/String;Lc/a/b/a;IILjava/util/Map;)Lc/a/b/j/b;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lc/a/b/a;",
            "II",
            "Ljava/util/Map<",
            "Lc/a/b/c;",
            "*>;)",
            "Lc/a/b/j/b;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    .line 1
    sget-object v0, Lc/a/b/a;->CODE_128:Lc/a/b/a;

    if-ne p2, v0, :cond_9

    .line 2
    invoke-super/range {p0 .. p5}, Lc/a/b/l/m;->a(Ljava/lang/String;Lc/a/b/a;IILjava/util/Map;)Lc/a/b/j/b;

    move-result-object p1

    return-object p1

    .line 3
    :cond_9
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Can only encode CODE_128, but got "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(Ljava/lang/String;)[Z
    .registers 14

    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_e3

    const/16 v2, 0x50

    if-gt v0, v2, :cond_e3

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_d
    const/16 v4, 0x20

    if-ge v3, v0, :cond_38

    .line 5
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-lt v5, v4, :cond_1b

    const/16 v4, 0x7e

    if-le v5, v4, :cond_35

    :cond_1b
    packed-switch v5, :pswitch_data_fa

    .line 6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Bad character in input: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_35
    :pswitch_35
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .line 7
    :cond_38
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    :cond_41
    :goto_41
    if-ge v5, v0, :cond_9d

    const/16 v9, 0x63

    if-ne v7, v9, :cond_49

    const/4 v10, 0x2

    goto :goto_4a

    :cond_49
    const/4 v10, 0x4

    .line 8
    :goto_4a
    invoke-static {p1, v5, v10}, Lc/a/b/l/d;->a(Ljava/lang/CharSequence;II)Z

    move-result v10

    const/16 v11, 0x64

    if-eqz v10, :cond_53

    goto :goto_55

    :cond_53
    const/16 v9, 0x64

    :goto_55
    if-ne v9, v7, :cond_7e

    .line 9
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v9

    packed-switch v9, :pswitch_data_106

    if-ne v7, v11, :cond_70

    .line 10
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v9

    add-int/lit8 v11, v9, -0x20

    goto :goto_7c

    :pswitch_67
    const/16 v11, 0x60

    goto :goto_7c

    :pswitch_6a
    const/16 v11, 0x61

    goto :goto_7c

    :pswitch_6d
    const/16 v11, 0x66

    goto :goto_7c

    :cond_70
    add-int/lit8 v9, v5, 0x2

    .line 11
    invoke-virtual {p1, v5, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    add-int/lit8 v5, v5, 0x1

    :goto_7c
    :pswitch_7c
    add-int/2addr v5, v1

    goto :goto_8e

    :cond_7e
    if-nez v7, :cond_8c

    if-ne v9, v11, :cond_87

    const/16 v7, 0x68

    const/16 v11, 0x68

    goto :goto_8d

    :cond_87
    const/16 v7, 0x69

    const/16 v11, 0x69

    goto :goto_8d

    :cond_8c
    move v11, v9

    :goto_8d
    move v7, v9

    .line 12
    :goto_8e
    sget-object v9, Lc/a/b/l/c;->a:[[I

    aget-object v9, v9, v11

    invoke-interface {v3, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    mul-int v11, v11, v8

    add-int/2addr v6, v11

    if-eqz v5, :cond_41

    add-int/lit8 v8, v8, 0x1

    goto :goto_41

    .line 13
    :cond_9d
    rem-int/lit8 v6, v6, 0x67

    .line 14
    sget-object p1, Lc/a/b/l/c;->a:[[I

    aget-object p1, p1, v6

    invoke-interface {v3, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 15
    sget-object p1, Lc/a/b/l/c;->a:[[I

    const/16 v0, 0x6a

    aget-object p1, p1, v0

    invoke-interface {v3, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 16
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    :cond_b4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_ca

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [I

    .line 17
    array-length v5, v4

    const/4 v6, 0x0

    :goto_c2
    if-ge v6, v5, :cond_b4

    aget v7, v4, v6

    add-int/2addr v0, v7

    add-int/lit8 v6, v6, 0x1

    goto :goto_c2

    .line 18
    :cond_ca
    new-array p1, v0, [Z

    .line 19
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_d0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_e2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    .line 20
    invoke-static {p1, v2, v3, v1}, Lc/a/b/l/m;->a([ZI[IZ)I

    move-result v3

    add-int/2addr v2, v3

    goto :goto_d0

    :cond_e2
    return-object p1

    .line 21
    :cond_e3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Contents length should be between 1 and 80 characters, but got "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_data_fa
    .packed-switch 0xf1
        :pswitch_35
        :pswitch_35
        :pswitch_35
        :pswitch_35
    .end packed-switch

    :pswitch_data_106
    .packed-switch 0xf1
        :pswitch_6d
        :pswitch_6a
        :pswitch_67
        :pswitch_7c
    .end packed-switch
.end method
