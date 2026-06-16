.class public final Lc/a/b/k/b/f;
.super Ljava/lang/Object;
.source "EdifactEncoder.java"

# interfaces
.implements Lc/a/b/k/b/g;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Ljava/lang/CharSequence;I)Ljava/lang/String;
    .registers 10

    .line 34
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    sub-int/2addr v0, p1

    if-eqz v0, :cond_57

    .line 35
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-lt v0, v3, :cond_16

    add-int/lit8 v4, p1, 0x1

    .line 36
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    goto :goto_17

    :cond_16
    const/4 v4, 0x0

    :goto_17
    const/4 v5, 0x3

    if-lt v0, v5, :cond_21

    add-int/lit8 v6, p1, 0x2

    .line 37
    invoke-interface {p0, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    goto :goto_22

    :cond_21
    const/4 v6, 0x0

    :goto_22
    const/4 v7, 0x4

    if-lt v0, v7, :cond_2a

    add-int/2addr p1, v5

    .line 38
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    :cond_2a
    shl-int/lit8 p0, v1, 0x12

    shl-int/lit8 p1, v4, 0xc

    add-int/2addr p0, p1

    shl-int/lit8 p1, v6, 0x6

    add-int/2addr p0, p1

    add-int/2addr p0, v2

    shr-int/lit8 p1, p0, 0x10

    and-int/lit16 p1, p1, 0xff

    int-to-char p1, p1

    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-char v1, v1

    and-int/lit16 p0, p0, 0xff

    int-to-char p0, p0

    .line 39
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 40
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    if-lt v0, v3, :cond_4d

    .line 41
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_4d
    if-lt v0, v5, :cond_52

    .line 42
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 43
    :cond_52
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 44
    :cond_57
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "StringBuilder must not be empty"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static a(CLjava/lang/StringBuilder;)V
    .registers 4

    const/16 v0, 0x20

    if-lt p0, v0, :cond_c

    const/16 v0, 0x3f

    if-gt p0, v0, :cond_c

    .line 31
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_19

    :cond_c
    const/16 v0, 0x40

    if-lt p0, v0, :cond_1a

    const/16 v1, 0x5e

    if-gt p0, v1, :cond_1a

    sub-int/2addr p0, v0

    int-to-char p0, p0

    .line 32
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_19
    return-void

    .line 33
    :cond_1a
    invoke-static {p0}, Lc/a/b/k/b/j;->a(C)V

    const/4 p0, 0x0

    throw p0
.end method

.method public static a(Lc/a/b/k/b/h;Ljava/lang/CharSequence;)V
    .registers 8

    const/4 v0, 0x0

    .line 14
    :try_start_1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1
    :try_end_5
    .catchall {:try_start_1 .. :try_end_5} :catchall_7f

    if-nez v1, :cond_b

    .line 15
    invoke-virtual {p0, v0}, Lc/a/b/k/b/h;->b(I)V

    return-void

    :cond_b
    const/4 v2, 0x2

    const/4 v3, 0x1

    if-ne v1, v3, :cond_2b

    .line 16
    :try_start_f
    invoke-virtual {p0}, Lc/a/b/k/b/h;->l()V

    .line 17
    invoke-virtual {p0}, Lc/a/b/k/b/h;->g()Lc/a/b/k/b/k;

    move-result-object v4

    invoke-virtual {v4}, Lc/a/b/k/b/k;->a()I

    move-result v4

    invoke-virtual {p0}, Lc/a/b/k/b/h;->a()I

    move-result v5

    sub-int/2addr v4, v5

    .line 18
    invoke-virtual {p0}, Lc/a/b/k/b/h;->f()I

    move-result v5
    :try_end_23
    .catchall {:try_start_f .. :try_end_23} :catchall_7f

    if-nez v5, :cond_2b

    if-gt v4, v2, :cond_2b

    .line 19
    invoke-virtual {p0, v0}, Lc/a/b/k/b/h;->b(I)V

    return-void

    :cond_2b
    const/4 v4, 0x4

    if-gt v1, v4, :cond_77

    sub-int/2addr v1, v3

    .line 20
    :try_start_2f
    invoke-static {p1, v0}, Lc/a/b/k/b/f;->a(Ljava/lang/CharSequence;I)Ljava/lang/String;

    move-result-object p1

    .line 21
    invoke-virtual {p0}, Lc/a/b/k/b/h;->i()Z

    move-result v4

    xor-int/2addr v4, v3

    if-eqz v4, :cond_3d

    if-gt v1, v2, :cond_3d

    goto :goto_3e

    :cond_3d
    const/4 v3, 0x0

    :goto_3e
    if-gt v1, v2, :cond_65

    .line 22
    invoke-virtual {p0}, Lc/a/b/k/b/h;->a()I

    move-result v2

    add-int/2addr v2, v1

    invoke-virtual {p0, v2}, Lc/a/b/k/b/h;->c(I)V

    .line 23
    invoke-virtual {p0}, Lc/a/b/k/b/h;->g()Lc/a/b/k/b/k;

    move-result-object v2

    invoke-virtual {v2}, Lc/a/b/k/b/k;->a()I

    move-result v2

    invoke-virtual {p0}, Lc/a/b/k/b/h;->a()I

    move-result v4

    sub-int/2addr v2, v4

    const/4 v4, 0x3

    if-lt v2, v4, :cond_65

    .line 24
    invoke-virtual {p0}, Lc/a/b/k/b/h;->a()I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v2, v3

    invoke-virtual {p0, v2}, Lc/a/b/k/b/h;->c(I)V

    const/4 v3, 0x0

    :cond_65
    if-eqz v3, :cond_70

    .line 25
    invoke-virtual {p0}, Lc/a/b/k/b/h;->k()V

    .line 26
    iget p1, p0, Lc/a/b/k/b/h;->f:I

    sub-int/2addr p1, v1

    iput p1, p0, Lc/a/b/k/b/h;->f:I

    goto :goto_73

    .line 27
    :cond_70
    invoke-virtual {p0, p1}, Lc/a/b/k/b/h;->a(Ljava/lang/String;)V
    :try_end_73
    .catchall {:try_start_2f .. :try_end_73} :catchall_7f

    .line 28
    :goto_73
    invoke-virtual {p0, v0}, Lc/a/b/k/b/h;->b(I)V

    return-void

    .line 29
    :cond_77
    :try_start_77
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v1, "Count must not exceed 4"

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_7f
    .catchall {:try_start_77 .. :try_end_7f} :catchall_7f

    :catchall_7f
    move-exception p1

    .line 30
    invoke-virtual {p0, v0}, Lc/a/b/k/b/h;->b(I)V

    throw p1
.end method


# virtual methods
.method public a()I
    .registers 2

    const/4 v0, 0x4

    return v0
.end method

.method public a(Lc/a/b/k/b/h;)V
    .registers 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2
    :cond_5
    invoke-virtual {p1}, Lc/a/b/k/b/h;->i()Z

    move-result v1

    if-eqz v1, :cond_41

    .line 3
    invoke-virtual {p1}, Lc/a/b/k/b/h;->c()C

    move-result v1

    .line 4
    invoke-static {v1, v0}, Lc/a/b/k/b/f;->a(CLjava/lang/StringBuilder;)V

    .line 5
    iget v1, p1, Lc/a/b/k/b/h;->f:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p1, Lc/a/b/k/b/h;->f:I

    .line 6
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    const/4 v2, 0x4

    if-lt v1, v2, :cond_5

    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Lc/a/b/k/b/f;->a(Ljava/lang/CharSequence;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lc/a/b/k/b/h;->a(Ljava/lang/String;)V

    .line 8
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 9
    invoke-virtual {p1}, Lc/a/b/k/b/h;->d()Ljava/lang/String;

    move-result-object v2

    iget v3, p1, Lc/a/b/k/b/h;->f:I

    invoke-virtual {p0}, Lc/a/b/k/b/f;->a()I

    move-result v4

    invoke-static {v2, v3, v4}, Lc/a/b/k/b/j;->a(Ljava/lang/CharSequence;II)I

    move-result v2

    .line 10
    invoke-virtual {p0}, Lc/a/b/k/b/f;->a()I

    move-result v3

    if-eq v2, v3, :cond_5

    .line 11
    invoke-virtual {p1, v1}, Lc/a/b/k/b/h;->b(I)V

    :cond_41
    const/16 v1, 0x1f

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 13
    invoke-static {p1, v0}, Lc/a/b/k/b/f;->a(Lc/a/b/k/b/h;Ljava/lang/CharSequence;)V

    return-void
.end method
