.class public Lcom/google/android/material/datepicker/SingleDateSelector$a;
.super Lc/a/a/a/x/c;
.source "SingleDateSelector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/datepicker/SingleDateSelector;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;Lcom/google/android/material/datepicker/CalendarConstraints;Lc/a/a/a/x/l;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic n:Lc/a/a/a/x/l;

.field public final synthetic o:Lcom/google/android/material/datepicker/SingleDateSelector;


# direct methods
.method public constructor <init>(Lcom/google/android/material/datepicker/SingleDateSelector;Ljava/lang/String;Ljava/text/DateFormat;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/datepicker/CalendarConstraints;Lc/a/a/a/x/l;)V
    .registers 7

    .line 1
    iput-object p1, p0, Lcom/google/android/material/datepicker/SingleDateSelector$a;->o:Lcom/google/android/material/datepicker/SingleDateSelector;

    iput-object p6, p0, Lcom/google/android/material/datepicker/SingleDateSelector$a;->n:Lc/a/a/a/x/l;

    invoke-direct {p0, p2, p3, p4, p5}, Lc/a/a/a/x/c;-><init>(Ljava/lang/String;Ljava/text/DateFormat;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/datepicker/CalendarConstraints;)V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 2

    .line 4
    iget-object v0, p0, Lcom/google/android/material/datepicker/SingleDateSelector$a;->n:Lc/a/a/a/x/l;

    invoke-virtual {v0}, Lc/a/a/a/x/l;->a()V

    return-void
.end method

.method public a(Ljava/lang/Long;)V
    .registers 5

    if-nez p1, :cond_8

    .line 1
    iget-object p1, p0, Lcom/google/android/material/datepicker/SingleDateSelector$a;->o:Lcom/google/android/material/datepicker/SingleDateSelector;

    invoke-static {p1}, Lcom/google/android/material/datepicker/SingleDateSelector;->a(Lcom/google/android/material/datepicker/SingleDateSelector;)V

    goto :goto_11

    .line 2
    :cond_8
    iget-object v0, p0, Lcom/google/android/material/datepicker/SingleDateSelector$a;->o:Lcom/google/android/material/datepicker/SingleDateSelector;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/material/datepicker/SingleDateSelector;->b(J)V

    .line 3
    :goto_11
    iget-object p1, p0, Lcom/google/android/material/datepicker/SingleDateSelector$a;->n:Lc/a/a/a/x/l;

    iget-object v0, p0, Lcom/google/android/material/datepicker/SingleDateSelector$a;->o:Lcom/google/android/material/datepicker/SingleDateSelector;

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/SingleDateSelector;->a()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, v0}, Lc/a/a/a/x/l;->a(Ljava/lang/Object;)V

    return-void
.end method
