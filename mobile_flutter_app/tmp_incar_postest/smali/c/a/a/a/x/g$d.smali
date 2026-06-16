.class public Lc/a/a/a/x/g$d;
.super Ljava/lang/Object;
.source "MaterialDatePicker.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/x/g;->c(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lc/a/a/a/x/g;


# direct methods
.method public constructor <init>(Lc/a/a/a/x/g;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/x/g$d;->h:Lc/a/a/a/x/g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lc/a/a/a/x/g$d;->h:Lc/a/a/a/x/g;

    invoke-static {p1}, Lc/a/a/a/x/g;->e(Lc/a/a/a/x/g;)Landroid/widget/Button;

    move-result-object p1

    iget-object v0, p0, Lc/a/a/a/x/g$d;->h:Lc/a/a/a/x/g;

    invoke-static {v0}, Lc/a/a/a/x/g;->d(Lc/a/a/a/x/g;)Lcom/google/android/material/datepicker/DateSelector;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/material/datepicker/DateSelector;->c()Z

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/x/g$d;->h:Lc/a/a/a/x/g;

    invoke-static {p1}, Lc/a/a/a/x/g;->f(Lc/a/a/a/x/g;)Lcom/google/android/material/internal/CheckableImageButton;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/material/internal/CheckableImageButton;->toggle()V

    .line 3
    iget-object p1, p0, Lc/a/a/a/x/g$d;->h:Lc/a/a/a/x/g;

    invoke-static {p1}, Lc/a/a/a/x/g;->f(Lc/a/a/a/x/g;)Lcom/google/android/material/internal/CheckableImageButton;

    move-result-object v0

    invoke-static {p1, v0}, Lc/a/a/a/x/g;->a(Lc/a/a/a/x/g;Lcom/google/android/material/internal/CheckableImageButton;)V

    .line 4
    iget-object p1, p0, Lc/a/a/a/x/g$d;->h:Lc/a/a/a/x/g;

    invoke-static {p1}, Lc/a/a/a/x/g;->g(Lc/a/a/a/x/g;)V

    return-void
.end method
