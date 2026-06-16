.class public Ld/a/b/g/l/e/g;
.super Ld/a/b/g/l/c/j;
.source "DefaultInstallStrategy.java"


# static fields
.field public static a:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ld/a/b/g/l/c/j;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    .line 11
    sget-object v0, Ld/a/b/g/l/e/g;->a:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "update.plugin."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".UpdateInstallProvider"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Ld/a/b/g/l/e/g;->a:Ljava/lang/String;

    .line 13
    :cond_24
    sget-object p1, Ld/a/b/g/l/e/g;->a:Ljava/lang/String;

    return-object p1
.end method

.method public a(Landroid/content/Context;Ljava/lang/String;Ld/a/b/g/l/f/b;)V
    .registers 6

    .line 1
    new-instance p3, Landroid/content/Intent;

    invoke-direct {p3}, Landroid/content/Intent;-><init>()V

    const/high16 v0, 0x10000000

    .line 2
    invoke-virtual {p3, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    .line 3
    invoke-virtual {p3, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 5
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt p2, v1, :cond_27

    .line 6
    invoke-virtual {p0, p1}, Ld/a/b/g/l/e/g;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lnet/nyx/postest/util/update/util/UpdateInstallProvider;->a(Ljava/io/File;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    const/4 v0, 0x3

    .line 7
    invoke-virtual {p3, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    goto :goto_2b

    .line 8
    :cond_27
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p2

    :goto_2b
    const-string v0, "application/vnd.android.package-archive"

    .line 9
    invoke-virtual {p3, p2, v0}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 10
    invoke-virtual {p1, p3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
