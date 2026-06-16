.class public Ld/a/b/g/l/e/b;
.super Ld/a/b/g/l/c/e;
.source "DefaultDownloadNotifier.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ld/a/b/g/l/c/e;-><init>()V

    return-void
.end method

.method public static synthetic a(Ld/a/b/g/l/e/b;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Ld/a/b/g/l/e/b;->b()V

    return-void
.end method

.method public static synthetic b(Ld/a/b/g/l/e/b;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Ld/a/b/g/l/c/e;->a()V

    return-void
.end method

.method public static synthetic c(Ld/a/b/g/l/e/b;)Ld/a/b/g/l/f/b;
    .registers 1

    .line 1
    iget-object p0, p0, Ld/a/b/g/l/c/e;->a:Ld/a/b/g/l/f/b;

    return-object p0
.end method


# virtual methods
.method public a(Ld/a/b/g/l/f/b;Landroid/app/Activity;)Ld/a/b/g/l/c/d;
    .registers 3

    .line 2
    new-instance p1, Landroid/app/ProgressDialog;

    invoke-direct {p1, p2}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    const/4 p2, 0x1

    .line 3
    invoke-virtual {p1, p2}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    const/16 p2, 0x64

    .line 4
    invoke-virtual {p1, p2}, Landroid/app/ProgressDialog;->setMax(I)V

    const/4 p2, 0x0

    .line 5
    invoke-virtual {p1, p2}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 6
    invoke-virtual {p1, p2}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 7
    invoke-virtual {p1, p2}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 8
    invoke-static {p1}, Ld/a/b/g/l/g/c;->c(Landroid/app/Dialog;)V

    .line 9
    new-instance p2, Ld/a/b/g/l/e/b$a;

    invoke-direct {p2, p0, p1}, Ld/a/b/g/l/e/b$a;-><init>(Ld/a/b/g/l/e/b;Landroid/app/ProgressDialog;)V

    return-object p2
.end method

.method public final b()V
    .registers 4

    .line 2
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-static {}, Ld/a/b/g/l/g/a;->d()Ld/a/b/g/l/g/a;

    move-result-object v1

    invoke-virtual {v1}, Ld/a/b/g/l/g/a;->c()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Ld/a/b/g/l/c/e;->a:Ld/a/b/g/l/f/b;

    .line 3
    invoke-virtual {v1}, Ld/a/b/g/l/f/b;->g()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u4e0b\u8f7dapk\u5931\u8d25"

    .line 4
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u662f\u5426\u91cd\u65b0\u4e0b\u8f7d\uff1f"

    .line 5
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 6
    iget-object v1, p0, Ld/a/b/g/l/c/e;->a:Ld/a/b/g/l/f/b;

    invoke-virtual {v1}, Ld/a/b/g/l/f/b;->g()Z

    move-result v1

    if-eqz v1, :cond_30

    const-string v1, "\u9000\u51fa"

    goto :goto_32

    :cond_30
    const-string v1, "\u53d6\u6d88"

    :goto_32
    new-instance v2, Ld/a/b/g/l/e/b$c;

    invoke-direct {v2, p0}, Ld/a/b/g/l/e/b$c;-><init>(Ld/a/b/g/l/e/b;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ld/a/b/g/l/e/b$b;

    invoke-direct {v1, p0}, Ld/a/b/g/l/e/b$b;-><init>(Ld/a/b/g/l/e/b;)V

    const-string v2, "\u786e\u5b9a"

    .line 7
    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method
