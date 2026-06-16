.class public Lc/a/a/a/x/g$c;
.super Lc/a/a/a/x/l;
.source "MaterialDatePicker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/x/g;->E0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lc/a/a/a/x/l<",
        "TS;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/x/g;


# direct methods
.method public constructor <init>(Lc/a/a/a/x/g;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/x/g$c;->a:Lc/a/a/a/x/g;

    invoke-direct {p0}, Lc/a/a/a/x/l;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 3

    .line 3
    iget-object v0, p0, Lc/a/a/a/x/g$c;->a:Lc/a/a/a/x/g;

    invoke-static {v0}, Lc/a/a/a/x/g;->e(Lc/a/a/a/x/g;)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method

.method public a(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lc/a/a/a/x/g$c;->a:Lc/a/a/a/x/g;

    invoke-static {p1}, Lc/a/a/a/x/g;->c(Lc/a/a/a/x/g;)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/x/g$c;->a:Lc/a/a/a/x/g;

    invoke-static {p1}, Lc/a/a/a/x/g;->e(Lc/a/a/a/x/g;)Landroid/widget/Button;

    move-result-object p1

    iget-object v0, p0, Lc/a/a/a/x/g$c;->a:Lc/a/a/a/x/g;

    invoke-static {v0}, Lc/a/a/a/x/g;->d(Lc/a/a/a/x/g;)Lcom/google/android/material/datepicker/DateSelector;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/material/datepicker/DateSelector;->c()Z

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method
