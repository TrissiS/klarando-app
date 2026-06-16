.class public final Ld/a/a/d$e;
.super Ljava/lang/ref/SoftReference;
.source "BaseDialog.java"

# interfaces
.implements Ld/a/a/d$k;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ld/a/a/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ref/SoftReference<",
        "Landroid/content/DialogInterface$OnDismissListener;",
        ">;",
        "Ld/a/a/d$k;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/DialogInterface$OnDismissListener;)V
    .registers 2

    .line 2
    invoke-direct {p0, p1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/DialogInterface$OnDismissListener;Ld/a/a/d$a;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Ld/a/a/d$e;-><init>(Landroid/content/DialogInterface$OnDismissListener;)V

    return-void
.end method


# virtual methods
.method public b(Ld/a/a/d;)V
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

    check-cast v0, Landroid/content/DialogInterface$OnDismissListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    return-void
.end method
