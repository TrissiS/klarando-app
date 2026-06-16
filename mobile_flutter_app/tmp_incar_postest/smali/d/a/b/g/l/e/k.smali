.class public Ld/a/b/g/l/e/k;
.super Ljava/lang/RuntimeException;
.source "HttpException.java"


# instance fields
.field public code:I

.field public errorMsg:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 2
    iput p1, p0, Ld/a/b/g/l/e/k;->code:I

    .line 3
    iput-object p2, p0, Ld/a/b/g/l/e/k;->errorMsg:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getCode()I
    .registers 2

    .line 1
    iget v0, p0, Ld/a/b/g/l/e/k;->code:I

    return v0
.end method

.method public getErrorMsg()Ljava/lang/String;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/e/k;->errorMsg:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "HttpException{code="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Ld/a/b/g/l/e/k;->code:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", errorMsg=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ld/a/b/g/l/e/k;->errorMsg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
