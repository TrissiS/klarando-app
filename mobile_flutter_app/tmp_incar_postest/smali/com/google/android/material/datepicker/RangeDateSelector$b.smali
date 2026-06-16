.class public Lcom/google/android/material/datepicker/RangeDateSelector$b;
.super Lc/a/a/a/x/c;
.source "RangeDateSelector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/datepicker/RangeDateSelector;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;Lcom/google/android/material/datepicker/CalendarConstraints;Lc/a/a/a/x/l;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic n:Lcom/google/android/material/textfield/TextInputLayout;

.field public final synthetic o:Lcom/google/android/material/textfield/TextInputLayout;

.field public final synthetic p:Lc/a/a/a/x/l;

.field public final synthetic q:Lcom/google/android/material/datepicker/RangeDateSelector;


# direct methods
.method public constructor <init>(Lcom/google/android/material/datepicker/RangeDateSelector;Ljava/lang/String;Ljava/text/DateFormat;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/datepicker/CalendarConstraints;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputLayout;Lc/a/a/a/x/l;)V
    .registers 9

    .line 1
    iput-object p1, p0, Lcom/google/android/material/datepicker/RangeDateSelector$b;->q:Lcom/google/android/material/datepicker/RangeDateSelector;

    iput-object p6, p0, Lcom/google/android/material/datepicker/RangeDateSelector$b;->n:Lcom/google/android/material/textfield/TextInputLayout;

    iput-object p7, p0, Lcom/google/android/material/datepicker/RangeDateSelector$b;->o:Lcom/google/android/material/textfield/TextInputLayout;

    iput-object p8, p0, Lcom/google/android/material/datepicker/RangeDateSelector$b;->p:Lc/a/a/a/x/l;

    invoke-direct {p0, p2, p3, p4, p5}, Lc/a/a/a/x/c;-><init>(Ljava/lang/String;Ljava/text/DateFormat;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/datepicker/CalendarConstraints;)V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 5

    .line 3
    iget-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector$b;->q:Lcom/google/android/material/datepicker/RangeDateSelector;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/material/datepicker/RangeDateSelector;->b(Lcom/google/android/material/datepicker/RangeDateSelector;Ljava/lang/Long;)Ljava/lang/Long;

    .line 4
    iget-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector$b;->q:Lcom/google/android/material/datepicker/RangeDateSelector;

    iget-object v1, p0, Lcom/google/android/material/datepicker/RangeDateSelector$b;->n:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v2, p0, Lcom/google/android/material/datepicker/RangeDateSelector$b;->o:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v3, p0, Lcom/google/android/material/datepicker/RangeDateSelector$b;->p:Lc/a/a/a/x/l;

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/material/datepicker/RangeDateSelector;->a(Lcom/google/android/material/datepicker/RangeDateSelector;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputLayout;Lc/a/a/a/x/l;)V

    return-void
.end method

.method public a(Ljava/lang/Long;)V
    .registers 5

    .line 1
    iget-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector$b;->q:Lcom/google/android/material/datepicker/RangeDateSelector;

    invoke-static {v0, p1}, Lcom/google/android/material/datepicker/RangeDateSelector;->b(Lcom/google/android/material/datepicker/RangeDateSelector;Ljava/lang/Long;)Ljava/lang/Long;

    .line 2
    iget-object p1, p0, Lcom/google/android/material/datepicker/RangeDateSelector$b;->q:Lcom/google/android/material/datepicker/RangeDateSelector;

    iget-object v0, p0, Lcom/google/android/material/datepicker/RangeDateSelector$b;->n:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, p0, Lcom/google/android/material/datepicker/RangeDateSelector$b;->o:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v2, p0, Lcom/google/android/material/datepicker/RangeDateSelector$b;->p:Lc/a/a/a/x/l;

    invoke-static {p1, v0, v1, v2}, Lcom/google/android/material/datepicker/RangeDateSelector;->a(Lcom/google/android/material/datepicker/RangeDateSelector;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputLayout;Lc/a/a/a/x/l;)V

    return-void
.end method
