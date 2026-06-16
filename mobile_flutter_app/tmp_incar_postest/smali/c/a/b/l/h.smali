.class public final Lc/a/b/l/h;
.super Lc/a/b/l/p;
.source "EAN13Writer.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lc/a/b/l/p;-><init>()V

    return-void
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
    sget-object v0, Lc/a/b/a;->EAN_13:Lc/a/b/a;

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

    const-string p4, "Can only encode EAN_13, but got "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(Ljava/lang/String;)[Z
    .registers 11

    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xd

    if-ne v0, v1, :cond_7f

    .line 5
    :try_start_8
    invoke-static {p1}, Lc/a/b/l/o;->a(Ljava/lang/CharSequence;)Z

    move-result v0
    :try_end_c
    .catch Lc/a/b/d; {:try_start_8 .. :try_end_c} :catch_77

    if-eqz v0, :cond_6f

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 6
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 7
    sget-object v3, Lc/a/b/l/g;->e:[I

    aget v2, v3, v2

    const/16 v3, 0x5f

    new-array v3, v3, [Z

    .line 8
    sget-object v4, Lc/a/b/l/o;->a:[I

    invoke-static {v3, v0, v4, v1}, Lc/a/b/l/m;->a([ZI[IZ)I

    move-result v4

    add-int/2addr v4, v0

    const/4 v5, 0x1

    :goto_28
    const/4 v6, 0x6

    if-gt v5, v6, :cond_48

    add-int/lit8 v7, v5, 0x1

    .line 9
    invoke-virtual {p1, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    sub-int/2addr v6, v5

    shr-int v5, v2, v6

    and-int/2addr v5, v1

    if-ne v5, v1, :cond_3d

    add-int/lit8 v8, v8, 0xa

    .line 10
    :cond_3d
    sget-object v5, Lc/a/b/l/o;->d:[[I

    aget-object v5, v5, v8

    invoke-static {v3, v4, v5, v0}, Lc/a/b/l/m;->a([ZI[IZ)I

    move-result v5

    add-int/2addr v4, v5

    move v5, v7

    goto :goto_28

    .line 11
    :cond_48
    sget-object v2, Lc/a/b/l/o;->b:[I

    invoke-static {v3, v4, v2, v0}, Lc/a/b/l/m;->a([ZI[IZ)I

    move-result v0

    add-int/2addr v4, v0

    const/4 v0, 0x7

    :goto_50
    const/16 v2, 0xc

    if-gt v0, v2, :cond_69

    add-int/lit8 v2, v0, 0x1

    .line 12
    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 13
    sget-object v5, Lc/a/b/l/o;->c:[[I

    aget-object v0, v5, v0

    invoke-static {v3, v4, v0, v1}, Lc/a/b/l/m;->a([ZI[IZ)I

    move-result v0

    add-int/2addr v4, v0

    move v0, v2

    goto :goto_50

    .line 14
    :cond_69
    sget-object p1, Lc/a/b/l/o;->a:[I

    invoke-static {v3, v4, p1, v1}, Lc/a/b/l/m;->a([ZI[IZ)I

    return-object v3

    .line 15
    :cond_6f
    :try_start_6f
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Contents do not pass checksum"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_77
    .catch Lc/a/b/d; {:try_start_6f .. :try_end_77} :catch_77

    .line 16
    :catch_77
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Illegal contents"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 17
    :cond_7f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Requested contents should be 13 digits long, but got "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
