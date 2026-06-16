.class public final Ld/a/a/d$g;
.super Ljava/lang/ref/SoftReference;
.source "BaseDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;
.implements Landroid/content/DialogInterface$OnCancelListener;
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ld/a/a/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "g"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Landroid/content/DialogInterface$OnShowListener;",
        ":",
        "Landroid/content/DialogInterface$OnCancelListener;",
        ":",
        "Landroid/content/DialogInterface$OnDismissListener;",
        ">",
        "Ljava/lang/ref/SoftReference<",
        "TT;>;",
        "Landroid/content/DialogInterface$OnShowListener;",
        "Landroid/content/DialogInterface$OnCancelListener;",
        "Landroid/content/DialogInterface$OnDismissListener;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/DialogInterface$OnShowListener;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 2
    invoke-direct {p0, p1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/DialogInterface$OnShowListener;Ld/a/a/d$a;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Ld/a/a/d$g;-><init>(Landroid/content/DialogInterface$OnShowListener;)V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    .line 2
    :cond_7
    invoke-virtual {p0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/DialogInterface$OnShowListener;

    check-cast v0, Landroid/content/DialogInterface$OnCancelListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnCancelListener;->onCancel(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    .line 2
    :cond_7
    invoke-virtual {p0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/DialogInterface$OnShowListener;

    check-cast v0, Landroid/content/DialogInterface$OnDismissListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public onShow(Landroid/content/DialogInterface;)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    .line 2
    :cond_7
    invoke-virtual {p0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/DialogInterface$OnShowListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnShowListener;->onShow(Landroid/content/DialogInterface;)V

    return-void
.end method
