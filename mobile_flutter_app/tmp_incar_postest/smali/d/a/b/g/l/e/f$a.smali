.class public Ld/a/b/g/l/e/f$a;
.super Ljava/lang/Object;
.source "DefaultInstallNotifier.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ld/a/b/g/l/e/f;->a(Landroid/app/Activity;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Ld/a/b/g/l/e/f;


# direct methods
.method public constructor <init>(Ld/a/b/g/l/e/f;)V
    .registers 2

    .line 1
    iput-object p1, p0, Ld/a/b/g/l/e/f$a;->h:Ld/a/b/g/l/e/f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 1
    iget-object p2, p0, Ld/a/b/g/l/e/f$a;->h:Ld/a/b/g/l/e/f;

    invoke-static {p2}, Ld/a/b/g/l/e/f;->a(Ld/a/b/g/l/e/f;)Ld/a/b/g/l/f/b;

    move-result-object p2

    invoke-virtual {p2}, Ld/a/b/g/l/f/b;->g()Z

    move-result p2

    if-eqz p2, :cond_12

    .line 2
    iget-object p2, p0, Ld/a/b/g/l/e/f$a;->h:Ld/a/b/g/l/e/f;

    invoke-static {p2, p1}, Ld/a/b/g/l/e/f;->a(Ld/a/b/g/l/e/f;Landroid/content/DialogInterface;)V

    goto :goto_17

    .line 3
    :cond_12
    check-cast p1, Landroid/app/Dialog;

    invoke-static {p1}, Ld/a/b/g/l/g/c;->b(Landroid/app/Dialog;)V

    .line 4
    :goto_17
    iget-object p1, p0, Ld/a/b/g/l/e/f$a;->h:Ld/a/b/g/l/e/f;

    invoke-virtual {p1}, Ld/a/b/g/l/c/i;->b()V

    return-void
.end method
