.class public Lb/e/a$a;
.super Lb/e/f;
.source "ArrayMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/e/a;->b()Lb/e/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lb/e/f<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field public final synthetic d:Lb/e/a;


# direct methods
.method public constructor <init>(Lb/e/a;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/e/a$a;->d:Lb/e/a;

    invoke-direct {p0}, Lb/e/f;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)I
    .registers 3

    .line 2
    iget-object v0, p0, Lb/e/a$a;->d:Lb/e/a;

    invoke-virtual {v0, p1}, Lb/e/g;->a(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public a(II)Ljava/lang/Object;
    .registers 4

    .line 1
    iget-object v0, p0, Lb/e/a$a;->d:Lb/e/a;

    iget-object v0, v0, Lb/e/g;->i:[Ljava/lang/Object;

    shl-int/lit8 p1, p1, 0x1

    add-int/2addr p1, p2

    aget-object p1, v0, p1

    return-object p1
.end method

.method public a(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;)TV;"
        }
    .end annotation

    .line 4
    iget-object v0, p0, Lb/e/a$a;->d:Lb/e/a;

    invoke-virtual {v0, p1, p2}, Lb/e/g;->a(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public a()V
    .registers 2

    .line 6
    iget-object v0, p0, Lb/e/a$a;->d:Lb/e/a;

    invoke-virtual {v0}, Lb/e/g;->clear()V

    return-void
.end method

.method public a(I)V
    .registers 3

    .line 5
    iget-object v0, p0, Lb/e/a$a;->d:Lb/e/a;

    invoke-virtual {v0, p1}, Lb/e/g;->d(I)Ljava/lang/Object;

    return-void
.end method

.method public a(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    .line 3
    iget-object v0, p0, Lb/e/a$a;->d:Lb/e/a;

    invoke-virtual {v0, p1, p2}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public b(Ljava/lang/Object;)I
    .registers 3

    .line 1
    iget-object v0, p0, Lb/e/a$a;->d:Lb/e/a;

    invoke-virtual {v0, p1}, Lb/e/g;->b(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public b()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation

    .line 2
    iget-object v0, p0, Lb/e/a$a;->d:Lb/e/a;

    return-object v0
.end method

.method public c()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/e/a$a;->d:Lb/e/a;

    iget v0, v0, Lb/e/g;->j:I

    return v0
.end method
