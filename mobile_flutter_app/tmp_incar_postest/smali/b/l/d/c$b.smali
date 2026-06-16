.class public Lb/l/d/c$b;
.super Ljava/lang/Object;
.source "DialogFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


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
    iput-object p1, p0, Lb/l/d/c$b;->h:Lb/l/d/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SyntheticAccessor"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lb/l/d/c$b;->h:Lb/l/d/c;

    invoke-static {p1}, Lb/l/d/c;->a(Lb/l/d/c;)Landroid/app/Dialog;

    move-result-object p1

    if-eqz p1, :cond_11

    .line 2
    iget-object p1, p0, Lb/l/d/c$b;->h:Lb/l/d/c;

    invoke-static {p1}, Lb/l/d/c;->a(Lb/l/d/c;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {p1, v0}, Lb/l/d/c;->onCancel(Landroid/content/DialogInterface;)V

    :cond_11
    return-void
.end method
