.class public abstract enum Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;
.super Ljava/lang/Enum;
.source "HttpAuthMethod.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/HttpAuthMethod;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4409
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

.field public static final enum BASIC:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

.field public static final enum DIGEST:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

.field public static final enum NEGOTIATE:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

.field public static final enum NONE:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 83
    new-instance v0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type$1;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->NONE:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    .line 94
    new-instance v0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type$2;

    const-string v1, "BASIC"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->BASIC:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    .line 105
    new-instance v0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type$3;

    const-string v1, "DIGEST"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->DIGEST:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    .line 116
    new-instance v0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type$4;

    const-string v1, "NEGOTIATE"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type$4;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->NEGOTIATE:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    .line 82
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    sget-object v1, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->NONE:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->BASIC:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->DIGEST:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->NEGOTIATE:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    aput-object v1, v0, v5

    sput-object v0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->$VALUES:[Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 82
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILorg/eclipse/jgit/transport/HttpAuthMethod$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 82
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;
    .locals 1
    .parameter "name"

    .prologue
    .line 82
    const-class v0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;
    .locals 1

    .prologue
    .line 82
    sget-object v0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->$VALUES:[Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    return-object v0
.end method


# virtual methods
.method public abstract getSchemeName()Ljava/lang/String;
.end method

.method public abstract method(Ljava/lang/String;)Lorg/eclipse/jgit/transport/HttpAuthMethod;
.end method
