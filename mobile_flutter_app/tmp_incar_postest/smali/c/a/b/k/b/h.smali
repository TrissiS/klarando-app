.class public final Lc/a/b/k/b/h;
.super Ljava/lang/Object;
.source "EncoderContext.java"


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Lc/a/b/k/b/l;

.field public c:Lc/a/b/b;

.field public d:Lc/a/b/b;

.field public final e:Ljava/lang/StringBuilder;

.field public f:I

.field public g:I

.field public h:Lc/a/b/k/b/k;

.field public i:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 9

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "ISO-8859-1"

    .line 2
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    array-length v2, v0

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 4
    array-length v2, v0

    const/4 v3, 0x0

    :goto_15
    if-ge v3, v2, :cond_35

    .line 5
    aget-byte v4, v0, v3

    and-int/lit16 v4, v4, 0xff

    int-to-char v4, v4

    const/16 v5, 0x3f

    if-ne v4, v5, :cond_2f

    .line 6
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v5, :cond_27

    goto :goto_2f

    .line 7
    :cond_27
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Message contains characters outside ISO-8859-1 encoding."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 8
    :cond_2f
    :goto_2f
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    .line 9
    :cond_35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lc/a/b/k/b/h;->a:Ljava/lang/String;

    .line 10
    sget-object v0, Lc/a/b/k/b/l;->FORCE_NONE:Lc/a/b/k/b/l;

    iput-object v0, p0, Lc/a/b/k/b/h;->b:Lc/a/b/k/b/l;

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lc/a/b/k/b/h;->e:Ljava/lang/StringBuilder;

    const/4 p1, -0x1

    .line 12
    iput p1, p0, Lc/a/b/k/b/h;->g:I

    return-void
.end method


# virtual methods
.method public a()I
    .registers 2

    .line 7
    iget-object v0, p0, Lc/a/b/k/b/h;->e:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    return v0
.end method

.method public a(C)V
    .registers 3

    .line 6
    iget-object v0, p0, Lc/a/b/k/b/h;->e:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-void
.end method

.method public a(I)V
    .registers 2

    .line 4
    iput p1, p0, Lc/a/b/k/b/h;->i:I

    return-void
.end method

.method public a(Lc/a/b/b;Lc/a/b/b;)V
    .registers 3

    .line 2
    iput-object p1, p0, Lc/a/b/k/b/h;->c:Lc/a/b/b;

    .line 3
    iput-object p2, p0, Lc/a/b/k/b/h;->d:Lc/a/b/b;

    return-void
.end method

.method public a(Lc/a/b/k/b/l;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/b/k/b/h;->b:Lc/a/b/k/b/l;

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .registers 3

    .line 5
    iget-object v0, p0, Lc/a/b/k/b/h;->e:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public b()Ljava/lang/StringBuilder;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/b/k/b/h;->e:Ljava/lang/StringBuilder;

    return-object v0
.end method

.method public b(I)V
    .registers 2

    .line 2
    iput p1, p0, Lc/a/b/k/b/h;->g:I

    return-void
.end method

.method public c()C
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/b/k/b/h;->a:Ljava/lang/String;

    iget v1, p0, Lc/a/b/k/b/h;->f:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0
.end method

.method public c(I)V
    .registers 6

    .line 2
    iget-object v0, p0, Lc/a/b/k/b/h;->h:Lc/a/b/k/b/k;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Lc/a/b/k/b/k;->a()I

    move-result v0

    if-le p1, v0, :cond_17

    .line 3
    :cond_a
    iget-object v0, p0, Lc/a/b/k/b/h;->b:Lc/a/b/k/b/l;

    iget-object v1, p0, Lc/a/b/k/b/h;->c:Lc/a/b/b;

    iget-object v2, p0, Lc/a/b/k/b/h;->d:Lc/a/b/b;

    const/4 v3, 0x1

    invoke-static {p1, v0, v1, v2, v3}, Lc/a/b/k/b/k;->a(ILc/a/b/k/b/l;Lc/a/b/b;Lc/a/b/b;Z)Lc/a/b/k/b/k;

    move-result-object p1

    iput-object p1, p0, Lc/a/b/k/b/h;->h:Lc/a/b/k/b/k;

    :cond_17
    return-void
.end method

.method public d()Ljava/lang/String;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/b/k/b/h;->a:Ljava/lang/String;

    return-object v0
.end method

.method public e()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/b/k/b/h;->g:I

    return v0
.end method

.method public f()I
    .registers 3

    .line 1
    invoke-virtual {p0}, Lc/a/b/k/b/h;->h()I

    move-result v0

    iget v1, p0, Lc/a/b/k/b/h;->f:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public g()Lc/a/b/k/b/k;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/b/k/b/h;->h:Lc/a/b/k/b/k;

    return-object v0
.end method

.method public final h()I
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/b/k/b/h;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iget v1, p0, Lc/a/b/k/b/h;->i:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public i()Z
    .registers 3

    .line 1
    iget v0, p0, Lc/a/b/k/b/h;->f:I

    invoke-virtual {p0}, Lc/a/b/k/b/h;->h()I

    move-result v1

    if-ge v0, v1, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0
.end method

.method public j()V
    .registers 2

    const/4 v0, -0x1

    .line 1
    iput v0, p0, Lc/a/b/k/b/h;->g:I

    return-void
.end method

.method public k()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    iput-object v0, p0, Lc/a/b/k/b/h;->h:Lc/a/b/k/b/k;

    return-void
.end method

.method public l()V
    .registers 2

    .line 1
    invoke-virtual {p0}, Lc/a/b/k/b/h;->a()I

    move-result v0

    invoke-virtual {p0, v0}, Lc/a/b/k/b/h;->c(I)V

    return-void
.end method
