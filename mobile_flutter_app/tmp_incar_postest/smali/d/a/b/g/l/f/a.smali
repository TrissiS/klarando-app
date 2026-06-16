.class public Ld/a/b/g/l/f/a;
.super Ljava/lang/Object;
.source "CheckEntity.java"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Z

.field public d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "GET"

    .line 2
    iput-object v0, p0, Ld/a/b/g/l/f/a;->a:Ljava/lang/String;

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Ld/a/b/g/l/f/a;->c:Z

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Ld/a/b/g/l/f/a;
    .registers 2

    .line 1
    iput-object p1, p0, Ld/a/b/g/l/f/a;->a:Ljava/lang/String;

    return-object p0
.end method

.method public a(Ljava/util/Map;)Ld/a/b/g/l/f/a;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ld/a/b/g/l/f/a;"
        }
    .end annotation

    .line 3
    iput-object p1, p0, Ld/a/b/g/l/f/a;->d:Ljava/util/Map;

    return-object p0
.end method

.method public a(Z)Ld/a/b/g/l/f/a;
    .registers 2

    .line 2
    iput-boolean p1, p0, Ld/a/b/g/l/f/a;->c:Z

    return-object p0
.end method

.method public a()Ljava/util/Map;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 4
    iget-object v0, p0, Ld/a/b/g/l/f/a;->e:Ljava/util/Map;

    if-nez v0, :cond_b

    .line 5
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ld/a/b/g/l/f/a;->e:Ljava/util/Map;

    .line 6
    :cond_b
    iget-boolean v0, p0, Ld/a/b/g/l/f/a;->c:Z

    if-eqz v0, :cond_18

    .line 7
    iget-object v0, p0, Ld/a/b/g/l/f/a;->e:Ljava/util/Map;

    const-string v1, "Content-Type"

    const-string v2, "application/json"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    :cond_18
    iget-object v0, p0, Ld/a/b/g/l/f/a;->e:Ljava/util/Map;

    return-object v0
.end method

.method public b(Ljava/lang/String;)Ld/a/b/g/l/f/a;
    .registers 2

    .line 1
    iput-object p1, p0, Ld/a/b/g/l/f/a;->b:Ljava/lang/String;

    return-object p0
.end method

.method public b()Z
    .registers 2

    .line 2
    iget-boolean v0, p0, Ld/a/b/g/l/f/a;->c:Z

    return v0
.end method

.method public c()Ljava/lang/String;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/f/a;->a:Ljava/lang/String;

    return-object v0
.end method

.method public d()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/f/a;->d:Ljava/util/Map;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ld/a/b/g/l/f/a;->d:Ljava/util/Map;

    .line 3
    :cond_b
    iget-object v0, p0, Ld/a/b/g/l/f/a;->d:Ljava/util/Map;

    return-object v0
.end method

.method public e()Ljava/lang/String;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/f/a;->b:Ljava/lang/String;

    return-object v0
.end method
