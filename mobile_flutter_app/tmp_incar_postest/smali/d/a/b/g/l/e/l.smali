.class public Ld/a/b/g/l/e/l;
.super Ld/a/b/g/l/c/n;
.source "WifiFirstStrategy.java"


# instance fields
.field public a:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ld/a/b/g/l/c/n;-><init>()V

    return-void
.end method


# virtual methods
.method public a()Z
    .registers 2

    .line 2
    iget-boolean v0, p0, Ld/a/b/g/l/e/l;->a:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public a(Ld/a/b/g/l/f/b;)Z
    .registers 2

    .line 1
    invoke-virtual {p0}, Ld/a/b/g/l/e/l;->c()Z

    move-result p1

    iput-boolean p1, p0, Ld/a/b/g/l/e/l;->a:Z

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public b()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Ld/a/b/g/l/e/l;->a:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public final c()Z
    .registers 4

    .line 1
    invoke-static {}, Ld/a/b/g/l/g/a;->d()Ld/a/b/g/l/g/a;

    move-result-object v0

    invoke-virtual {v0}, Ld/a/b/g/l/g/a;->b()Landroid/content/Context;

    move-result-object v0

    const-string v1, "connectivity"

    .line 2
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 3
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_24

    .line 4
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_24

    .line 5
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v0

    if-ne v0, v1, :cond_24

    goto :goto_25

    :cond_24
    const/4 v1, 0x0

    :goto_25
    return v1
.end method
