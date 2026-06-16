.class public Lb/e/b$a;
.super Lb/e/f;
.source "ArraySet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/e/b;->a()Lb/e/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lb/e/f<",
        "TE;TE;>;"
    }
.end annotation


# instance fields
.field public final synthetic d:Lb/e/b;


# direct methods
.method public constructor <init>(Lb/e/b;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/e/b$a;->d:Lb/e/b;

    invoke-direct {p0}, Lb/e/f;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)I
    .registers 3

    .line 2
    iget-object v0, p0, Lb/e/b$a;->d:Lb/e/b;

    invoke-virtual {v0, p1}, Lb/e/b;->a(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public a(II)Ljava/lang/Object;
    .registers 3

    .line 1
    iget-object p2, p0, Lb/e/b$a;->d:Lb/e/b;

    iget-object p2, p2, Lb/e/b;->i:[Ljava/lang/Object;

    aget-object p1, p2, p1

    return-object p1
.end method

.method public a(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)TE;"
        }
    .end annotation

    .line 4
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "not a map"

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a()V
    .registers 2

    .line 6
    iget-object v0, p0, Lb/e/b$a;->d:Lb/e/b;

    invoke-virtual {v0}, Lb/e/b;->clear()V

    return-void
.end method

.method public a(I)V
    .registers 3

    .line 5
    iget-object v0, p0, Lb/e/b$a;->d:Lb/e/b;

    invoke-virtual {v0, p1}, Lb/e/b;->c(I)Ljava/lang/Object;

    return-void
.end method

.method public a(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;TE;)V"
        }
    .end annotation

    .line 3
    iget-object p2, p0, Lb/e/b$a;->d:Lb/e/b;

    invoke-virtual {p2, p1}, Lb/e/b;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public b(Ljava/lang/Object;)I
    .registers 3

    .line 1
    iget-object v0, p0, Lb/e/b$a;->d:Lb/e/b;

    invoke-virtual {v0, p1}, Lb/e/b;->a(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public b()Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TE;TE;>;"
        }
    .end annotation

    .line 2
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "not a map"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public c()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/e/b$a;->d:Lb/e/b;

    iget v0, v0, Lb/e/b;->j:I

    return v0
.end method
