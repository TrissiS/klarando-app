.class public Lb/l/d/c$a;
.super Ljava/lang/Object;
.source "DialogFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/l/d/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/l/d/c;


# direct methods
.method public constructor <init>(Lb/l/d/c;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/l/d/c$a;->h:Lb/l/d/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SyntheticAccessor"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lb/l/d/c$a;->h:Lb/l/d/c;

    invoke-static {v0}, Lb/l/d/c;->b(Lb/l/d/c;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v0

    iget-object v1, p0, Lb/l/d/c$a;->h:Lb/l/d/c;

    invoke-static {v1}, Lb/l/d/c;->a(Lb/l/d/c;)Landroid/app/Dialog;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    return-void
.end method
