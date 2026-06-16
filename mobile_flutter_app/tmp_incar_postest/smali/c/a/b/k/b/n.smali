.class public final Lc/a/b/k/b/n;
.super Lc/a/b/k/b/c;
.source "X12Encoder.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lc/a/b/k/b/c;-><init>()V

    return-void
.end method


# virtual methods
.method public a()I
    .registers 2

    const/4 v0, 0x3

    return v0
.end method

.method public a(CLjava/lang/StringBuilder;)I
    .registers 6

    const/4 v0, 0x1

    const/16 v1, 0xd

    if-ne p1, v1, :cond_a

    const/4 p1, 0x0

    .line 13
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_43

    :cond_a
    const/16 v1, 0x2a

    if-ne p1, v1, :cond_12

    .line 14
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_43

    :cond_12
    const/16 v1, 0x3e

    if-ne p1, v1, :cond_1b

    const/4 p1, 0x2

    .line 15
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_43

    :cond_1b
    const/16 v1, 0x20

    if-ne p1, v1, :cond_24

    const/4 p1, 0x3

    .line 16
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_43

    :cond_24
    const/16 v1, 0x30

    if-lt p1, v1, :cond_34

    const/16 v2, 0x39

    if-gt p1, v2, :cond_34

    sub-int/2addr p1, v1

    add-int/lit8 p1, p1, 0x4

    int-to-char p1, p1

    .line 17
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_43

    :cond_34
    const/16 v1, 0x41

    if-lt p1, v1, :cond_44

    const/16 v2, 0x5a

    if-gt p1, v2, :cond_44

    sub-int/2addr p1, v1

    add-int/lit8 p1, p1, 0xe

    int-to-char p1, p1

    .line 18
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_43
    return v0

    .line 19
    :cond_44
    invoke-static {p1}, Lc/a/b/k/b/j;->a(C)V

    const/4 p1, 0x0

    throw p1
.end method

.method public a(Lc/a/b/k/b/h;)V
    .registers 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2
    :cond_5
    invoke-virtual {p1}, Lc/a/b/k/b/h;->i()Z

    move-result v1

    if-eqz v1, :cond_3a

    .line 3
    invoke-virtual {p1}, Lc/a/b/k/b/h;->c()C

    move-result v1

    .line 4
    iget v2, p1, Lc/a/b/k/b/h;->f:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p1, Lc/a/b/k/b/h;->f:I

    .line 5
    invoke-virtual {p0, v1, v0}, Lc/a/b/k/b/n;->a(CLjava/lang/StringBuilder;)I

    .line 6
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    .line 7
    rem-int/lit8 v1, v1, 0x3

    if-nez v1, :cond_5

    .line 8
    invoke-static {p1, v0}, Lc/a/b/k/b/c;->b(Lc/a/b/k/b/h;Ljava/lang/StringBuilder;)V

    .line 9
    invoke-virtual {p1}, Lc/a/b/k/b/h;->d()Ljava/lang/String;

    move-result-object v1

    iget v2, p1, Lc/a/b/k/b/h;->f:I

    invoke-virtual {p0}, Lc/a/b/k/b/n;->a()I

    move-result v3

    invoke-static {v1, v2, v3}, Lc/a/b/k/b/j;->a(Ljava/lang/CharSequence;II)I

    move-result v1

    .line 10
    invoke-virtual {p0}, Lc/a/b/k/b/n;->a()I

    move-result v2

    if-eq v1, v2, :cond_5

    .line 11
    invoke-virtual {p1, v1}, Lc/a/b/k/b/h;->b(I)V

    .line 12
    :cond_3a
    invoke-virtual {p0, p1, v0}, Lc/a/b/k/b/n;->a(Lc/a/b/k/b/h;Ljava/lang/StringBuilder;)V

    return-void
.end method

.method public a(Lc/a/b/k/b/h;Ljava/lang/StringBuilder;)V
    .registers 5

    .line 20
    invoke-virtual {p1}, Lc/a/b/k/b/h;->l()V

    .line 21
    invoke-virtual {p1}, Lc/a/b/k/b/h;->g()Lc/a/b/k/b/k;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/b/k/b/k;->a()I

    move-result v0

    invoke-virtual {p1}, Lc/a/b/k/b/h;->a()I

    move-result v1

    sub-int/2addr v0, v1

    .line 22
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result p2

    .line 23
    iget v1, p1, Lc/a/b/k/b/h;->f:I

    sub-int/2addr v1, p2

    iput v1, p1, Lc/a/b/k/b/h;->f:I

    .line 24
    invoke-virtual {p1}, Lc/a/b/k/b/h;->f()I

    move-result p2

    const/4 v1, 0x1

    if-gt p2, v1, :cond_28

    if-gt v0, v1, :cond_28

    .line 25
    invoke-virtual {p1}, Lc/a/b/k/b/h;->f()I

    move-result p2

    if-eq p2, v0, :cond_2d

    :cond_28
    const/16 p2, 0xfe

    .line 26
    invoke-virtual {p1, p2}, Lc/a/b/k/b/h;->a(C)V

    .line 27
    :cond_2d
    invoke-virtual {p1}, Lc/a/b/k/b/h;->e()I

    move-result p2

    if-gez p2, :cond_37

    const/4 p2, 0x0

    .line 28
    invoke-virtual {p1, p2}, Lc/a/b/k/b/h;->b(I)V

    :cond_37
    return-void
.end method
