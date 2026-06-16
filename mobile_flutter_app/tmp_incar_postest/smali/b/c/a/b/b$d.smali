.class public Lb/c/a/b/b$d;
.super Ljava/lang/Object;
.source "SafeIterableMap.java"

# interfaces
.implements Ljava/util/Iterator;
.implements Lb/c/a/b/b$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/c/a/b/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;",
        "Lb/c/a/b/b$f<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field public h:Lb/c/a/b/b$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/c/a/b/b$c<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field public i:Z

.field public final synthetic j:Lb/c/a/b/b;


# direct methods
.method public constructor <init>(Lb/c/a/b/b;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/c/a/b/b$d;->j:Lb/c/a/b/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lb/c/a/b/b$d;->i:Z

    return-void
.end method


# virtual methods
.method public a(Lb/c/a/b/b$c;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/c/a/b/b$c<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lb/c/a/b/b$d;->h:Lb/c/a/b/b$c;

    if-ne p1, v0, :cond_f

    .line 2
    iget-object p1, v0, Lb/c/a/b/b$c;->k:Lb/c/a/b/b$c;

    iput-object p1, p0, Lb/c/a/b/b$d;->h:Lb/c/a/b/b$c;

    if-nez p1, :cond_c

    const/4 p1, 0x1

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    .line 3
    :goto_d
    iput-boolean p1, p0, Lb/c/a/b/b$d;->i:Z

    :cond_f
    return-void
.end method

.method public hasNext()Z
    .registers 4

    .line 1
    iget-boolean v0, p0, Lb/c/a/b/b$d;->i:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_f

    .line 2
    iget-object v0, p0, Lb/c/a/b/b$d;->j:Lb/c/a/b/b;

    iget-object v0, v0, Lb/c/a/b/b;->h:Lb/c/a/b/b$c;

    if-eqz v0, :cond_d

    goto :goto_e

    :cond_d
    const/4 v1, 0x0

    :goto_e
    return v1

    .line 3
    :cond_f
    iget-object v0, p0, Lb/c/a/b/b$d;->h:Lb/c/a/b/b$c;

    if-eqz v0, :cond_18

    iget-object v0, v0, Lb/c/a/b/b$c;->j:Lb/c/a/b/b$c;

    if-eqz v0, :cond_18

    goto :goto_19

    :cond_18
    const/4 v1, 0x0

    :goto_19
    return v1
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lb/c/a/b/b$d;->next()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/util/Map$Entry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 2
    iget-boolean v0, p0, Lb/c/a/b/b$d;->i:Z

    if-eqz v0, :cond_e

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Lb/c/a/b/b$d;->i:Z

    .line 4
    iget-object v0, p0, Lb/c/a/b/b$d;->j:Lb/c/a/b/b;

    iget-object v0, v0, Lb/c/a/b/b;->h:Lb/c/a/b/b$c;

    iput-object v0, p0, Lb/c/a/b/b$d;->h:Lb/c/a/b/b$c;

    goto :goto_18

    .line 5
    :cond_e
    iget-object v0, p0, Lb/c/a/b/b$d;->h:Lb/c/a/b/b$c;

    if-eqz v0, :cond_15

    iget-object v0, v0, Lb/c/a/b/b$c;->j:Lb/c/a/b/b$c;

    goto :goto_16

    :cond_15
    const/4 v0, 0x0

    :goto_16
    iput-object v0, p0, Lb/c/a/b/b$d;->h:Lb/c/a/b/b$c;

    .line 6
    :goto_18
    iget-object v0, p0, Lb/c/a/b/b$d;->h:Lb/c/a/b/b$c;

    return-object v0
.end method
