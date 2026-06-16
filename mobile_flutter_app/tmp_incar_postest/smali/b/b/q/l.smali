.class public final Lb/b/q/l;
.super Ljava/lang/Object;
.source "AppCompatTextClassifierHelper.java"


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/view/textclassifier/TextClassifier;


# direct methods
.method public constructor <init>(Landroid/widget/TextView;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-static {p1}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lb/b/q/l;->a:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public a()Landroid/view/textclassifier/TextClassifier;
    .registers 3

    .line 2
    iget-object v0, p0, Lb/b/q/l;->b:Landroid/view/textclassifier/TextClassifier;

    if-nez v0, :cond_1b

    .line 3
    iget-object v0, p0, Lb/b/q/l;->a:Landroid/widget/TextView;

    .line 4
    invoke-virtual {v0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Landroid/view/textclassifier/TextClassificationManager;

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/textclassifier/TextClassificationManager;

    if-eqz v0, :cond_19

    .line 5
    invoke-virtual {v0}, Landroid/view/textclassifier/TextClassificationManager;->getTextClassifier()Landroid/view/textclassifier/TextClassifier;

    move-result-object v0

    return-object v0

    .line 6
    :cond_19
    sget-object v0, Landroid/view/textclassifier/TextClassifier;->NO_OP:Landroid/view/textclassifier/TextClassifier;

    :cond_1b
    return-object v0
.end method

.method public a(Landroid/view/textclassifier/TextClassifier;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/b/q/l;->b:Landroid/view/textclassifier/TextClassifier;

    return-void
.end method
