.class public Ld/a/b/g/l/e/f;
.super Ld/a/b/g/l/c/i;
.source "DefaultInstallNotifier.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ld/a/b/g/l/c/i;-><init>()V

    return-void
.end method

.method public static synthetic a(Ld/a/b/g/l/e/f;)Ld/a/b/g/l/f/b;
    .registers 1

    .line 1
    iget-object p0, p0, Ld/a/b/g/l/c/i;->b:Ld/a/b/g/l/f/b;

    return-object p0
.end method

.method public static synthetic a(Ld/a/b/g/l/e/f;Landroid/content/DialogInterface;)V
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Ld/a/b/g/l/e/f;->a(Landroid/content/DialogInterface;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/app/Activity;)Landroid/app/Dialog;
    .registers 6

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    .line 3
    iget-object v1, p0, Ld/a/b/g/l/c/i;->b:Ld/a/b/g/l/f/b;

    .line 4
    invoke-virtual {v1}, Ld/a/b/g/l/f/b;->f()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget-object v1, p0, Ld/a/b/g/l/c/i;->b:Ld/a/b/g/l/f/b;

    invoke-virtual {v1}, Ld/a/b/g/l/f/b;->c()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x1

    aput-object v1, v0, v3

    const-string v1, "\u7248\u672c\u53f7\uff1a%s\n\n%s"

    .line 5
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 6
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string p1, "\u5b89\u88c5\u5305\u5df2\u5c31\u7eea\uff0c\u662f\u5426\u5b89\u88c5\uff1f"

    .line 7
    invoke-virtual {v1, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 8
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Ld/a/b/g/l/e/f$a;

    invoke-direct {v0, p0}, Ld/a/b/g/l/e/f$a;-><init>(Ld/a/b/g/l/e/f;)V

    const-string v1, "\u7acb\u5373\u5b89\u88c5"

    .line 9
    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 10
    iget-object v0, p0, Ld/a/b/g/l/c/i;->b:Ld/a/b/g/l/f/b;

    invoke-virtual {v0}, Ld/a/b/g/l/f/b;->g()Z

    move-result v0

    if-nez v0, :cond_4f

    iget-object v0, p0, Ld/a/b/g/l/c/i;->b:Ld/a/b/g/l/f/b;

    invoke-virtual {v0}, Ld/a/b/g/l/f/b;->h()Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 11
    new-instance v0, Ld/a/b/g/l/e/f$b;

    invoke-direct {v0, p0}, Ld/a/b/g/l/e/f$b;-><init>(Ld/a/b/g/l/e/f;)V

    const-string v1, "\u5ffd\u7565\u6b64\u7248\u672c"

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 12
    :cond_4f
    iget-object v0, p0, Ld/a/b/g/l/c/i;->b:Ld/a/b/g/l/f/b;

    invoke-virtual {v0}, Ld/a/b/g/l/f/b;->g()Z

    move-result v0

    if-nez v0, :cond_61

    .line 13
    new-instance v0, Ld/a/b/g/l/e/f$c;

    invoke-direct {v0, p0}, Ld/a/b/g/l/e/f$c;-><init>(Ld/a/b/g/l/e/f;)V

    const-string v1, "\u53d6\u6d88"

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 14
    :cond_61
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    .line 15
    invoke-virtual {p1, v2}, Landroid/app/AlertDialog;->setCancelable(Z)V

    .line 16
    invoke-virtual {p1, v2}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    return-object p1
.end method

.method public final a(Landroid/content/DialogInterface;)V
    .registers 4

    .line 17
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "mShowing"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x1

    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    const/4 v1, 0x0

    .line 19
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1a} :catch_1a

    :catch_1a
    return-void
.end method
