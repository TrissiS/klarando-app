.class public Ld/a/b/g/l/e/h;
.super Ld/a/b/g/l/c/l;
.source "DefaultUpdateChecker.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ld/a/b/g/l/c/l;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;)I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p1

    .line 7
    iget p1, p1, Landroid/content/pm/PackageInfo;->versionCode:I

    return p1
.end method

.method public a(Ld/a/b/g/l/f/b;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {}, Ld/a/b/g/l/g/a;->d()Ld/a/b/g/l/g/a;

    move-result-object v0

    invoke-virtual {v0}, Ld/a/b/g/l/g/a;->b()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Ld/a/b/g/l/e/h;->a(Landroid/content/Context;)I

    move-result v0

    .line 2
    invoke-virtual {p1}, Ld/a/b/g/l/f/b;->e()I

    move-result v1

    if-le v1, v0, :cond_2c

    .line 3
    invoke-virtual {p1}, Ld/a/b/g/l/f/b;->g()Z

    move-result v0

    if-nez v0, :cond_2a

    .line 4
    invoke-static {}, Ld/a/b/g/l/g/d;->a()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1}, Ld/a/b/g/l/f/b;->e()I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2c

    :cond_2a
    const/4 p1, 0x1

    goto :goto_2d

    :cond_2c
    const/4 p1, 0x0

    :goto_2d
    return p1
.end method
