.class public Lc/a/a/a/p0/d$g;
.super Ljava/lang/Object;
.source "DropdownMenuEndIconDelegate.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/p0/d;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lc/a/a/a/p0/d;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/d;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/d$g;->h:Lc/a/a/a/p0/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lc/a/a/a/p0/d$g;->h:Lc/a/a/a/p0/d;

    iget-object p1, p1, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object p1

    check-cast p1, Landroid/widget/AutoCompleteTextView;

    .line 2
    iget-object v0, p0, Lc/a/a/a/p0/d$g;->h:Lc/a/a/a/p0/d;

    invoke-static {v0, p1}, Lc/a/a/a/p0/d;->a(Lc/a/a/a/p0/d;Landroid/widget/AutoCompleteTextView;)V

    return-void
.end method
