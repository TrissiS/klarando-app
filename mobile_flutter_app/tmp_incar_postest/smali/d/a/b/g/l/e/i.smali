.class public Ld/a/b/g/l/e/i;
.super Ld/a/b/g/l/c/b;
.source "DefaultUpdateNotifier.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ld/a/b/g/l/c/b;-><init>()V

    return-void
.end method

.method public static synthetic a(Ld/a/b/g/l/e/i;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Ld/a/b/g/l/c/b;->c()V

    return-void
.end method

.method public static synthetic b(Ld/a/b/g/l/e/i;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Ld/a/b/g/l/c/b;->b()V

    return-void
.end method


# virtual methods
.method public a(Landroid/app/Activity;)Landroid/app/Dialog;
    .registers 4

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u7248\u672c\u53f7: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ld/a/b/g/l/c/b;->b:Ld/a/b/g/l/f/b;

    invoke-virtual {v1}, Ld/a/b/g/l/f/b;->f()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n\n\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ld/a/b/g/l/c/b;->b:Ld/a/b/g/l/f/b;

    .line 3
    invoke-virtual {v1}, Ld/a/b/g/l/f/b;->c()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 4
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 5
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u4f60\u6709\u65b0\u7248\u672c\u9700\u8981\u66f4\u65b0"

    .line 6
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Ld/a/b/g/l/e/i$a;

    invoke-direct {v0, p0}, Ld/a/b/g/l/e/i$a;-><init>(Ld/a/b/g/l/e/i;)V

    const-string v1, "\u7acb\u5373\u66f4\u65b0"

    .line 7
    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 8
    iget-object v0, p0, Ld/a/b/g/l/c/b;->b:Ld/a/b/g/l/f/b;

    invoke-virtual {v0}, Ld/a/b/g/l/f/b;->h()Z

    move-result v0

    if-eqz v0, :cond_59

    iget-object v0, p0, Ld/a/b/g/l/c/b;->b:Ld/a/b/g/l/f/b;

    invoke-virtual {v0}, Ld/a/b/g/l/f/b;->g()Z

    move-result v0

    if-nez v0, :cond_59

    .line 9
    new-instance v0, Ld/a/b/g/l/e/i$b;

    invoke-direct {v0, p0}, Ld/a/b/g/l/e/i$b;-><init>(Ld/a/b/g/l/e/i;)V

    const-string v1, "\u5ffd\u7565\u6b64\u7248\u672c"

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 10
    :cond_59
    iget-object v0, p0, Ld/a/b/g/l/c/b;->b:Ld/a/b/g/l/f/b;

    invoke-virtual {v0}, Ld/a/b/g/l/f/b;->g()Z

    move-result v0

    if-nez v0, :cond_6b

    .line 11
    new-instance v0, Ld/a/b/g/l/e/i$c;

    invoke-direct {v0, p0}, Ld/a/b/g/l/e/i$c;-><init>(Ld/a/b/g/l/e/i;)V

    const-string v1, "\u53d6\u6d88"

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    :cond_6b
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 13
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method
