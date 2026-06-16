.class public final Lc/a/b/n/c/f;
.super Ljava/lang/Object;
.source "QRCode.java"


# instance fields
.field public a:Lc/a/b/n/b/b;

.field public b:Lc/a/b/n/b/a;

.field public c:Lc/a/b/n/b/c;

.field public d:I

.field public e:Lc/a/b/n/c/b;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lc/a/b/n/c/f;->d:I

    return-void
.end method

.method public static b(I)Z
    .registers 2

    if-ltz p0, :cond_8

    const/16 v0, 0x8

    if-ge p0, v0, :cond_8

    const/4 p0, 0x1

    goto :goto_9

    :cond_8
    const/4 p0, 0x0

    :goto_9
    return p0
.end method


# virtual methods
.method public a()Lc/a/b/n/c/b;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/b/n/c/f;->e:Lc/a/b/n/c/b;

    return-object v0
.end method

.method public a(I)V
    .registers 2

    .line 5
    iput p1, p0, Lc/a/b/n/c/f;->d:I

    return-void
.end method

.method public a(Lc/a/b/n/b/a;)V
    .registers 2

    .line 3
    iput-object p1, p0, Lc/a/b/n/c/f;->b:Lc/a/b/n/b/a;

    return-void
.end method

.method public a(Lc/a/b/n/b/b;)V
    .registers 2

    .line 2
    iput-object p1, p0, Lc/a/b/n/c/f;->a:Lc/a/b/n/b/b;

    return-void
.end method

.method public a(Lc/a/b/n/b/c;)V
    .registers 2

    .line 4
    iput-object p1, p0, Lc/a/b/n/c/f;->c:Lc/a/b/n/b/c;

    return-void
.end method

.method public a(Lc/a/b/n/c/b;)V
    .registers 2

    .line 6
    iput-object p1, p0, Lc/a/b/n/c/f;->e:Lc/a/b/n/c/b;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0xc8

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "<<\n"

    .line 2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " mode: "

    .line 3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4
    iget-object v1, p0, Lc/a/b/n/c/f;->a:Lc/a/b/n/b/b;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "\n ecLevel: "

    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6
    iget-object v1, p0, Lc/a/b/n/c/f;->b:Lc/a/b/n/b/a;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "\n version: "

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 8
    iget-object v1, p0, Lc/a/b/n/c/f;->c:Lc/a/b/n/b/c;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "\n maskPattern: "

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    iget v1, p0, Lc/a/b/n/c/f;->d:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    iget-object v1, p0, Lc/a/b/n/c/f;->e:Lc/a/b/n/c/b;

    if-nez v1, :cond_3e

    const-string v1, "\n matrix: null\n"

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_48

    :cond_3e
    const-string v1, "\n matrix:\n"

    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    iget-object v1, p0, Lc/a/b/n/c/f;->e:Lc/a/b/n/c/b;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :goto_48
    const-string v1, ">>\n"

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
