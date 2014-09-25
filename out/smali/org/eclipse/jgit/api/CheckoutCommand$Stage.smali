.class public final enum Lorg/eclipse/jgit/api/CheckoutCommand$Stage;
.super Ljava/lang/Enum;
.source "CheckoutCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/CheckoutCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Stage"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/api/CheckoutCommand$Stage;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

.field public static final enum BASE:Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

.field public static final enum OURS:Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

.field public static final enum THEIRS:Lorg/eclipse/jgit/api/CheckoutCommand$Stage;


# instance fields
.field private final number:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x0

    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 137
    new-instance v0, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    const-string v1, "BASE"

    invoke-direct {v0, v1, v4, v2}, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;->BASE:Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    .line 142
    new-instance v0, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    const-string v1, "OURS"

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;->OURS:Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    .line 147
    new-instance v0, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    const-string v1, "THEIRS"

    invoke-direct {v0, v1, v3, v5}, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;->THEIRS:Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    .line 133
    new-array v0, v5, [Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    sget-object v1, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;->BASE:Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;->OURS:Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;->THEIRS:Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    aput-object v1, v0, v3

    sput-object v0, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;->$VALUES:[Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .parameter
    .parameter
    .parameter "number"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 151
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 152
    iput p3, p0, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;->number:I

    .line 153
    return-void
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/api/CheckoutCommand$Stage;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 133
    iget v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;->number:I

    return v0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/api/CheckoutCommand$Stage;
    .locals 1
    .parameter "name"

    .prologue
    .line 133
    const-class v0, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/api/CheckoutCommand$Stage;
    .locals 1

    .prologue
    .line 133
    sget-object v0, Lorg/eclipse/jgit/api/CheckoutCommand$Stage;->$VALUES:[Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/api/CheckoutCommand$Stage;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    return-object v0
.end method
