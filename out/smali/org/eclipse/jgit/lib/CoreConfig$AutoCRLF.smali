.class public final enum Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;
.super Ljava/lang/Enum;
.source "CoreConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/CoreConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AutoCRLF"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

.field public static final enum FALSE:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

.field public static final enum INPUT:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

.field public static final enum TRUE:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 68
    new-instance v0, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    const-string v1, "FALSE"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->FALSE:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    .line 71
    new-instance v0, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    const-string v1, "TRUE"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->TRUE:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    .line 74
    new-instance v0, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    const-string v1, "INPUT"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->INPUT:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    .line 66
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    sget-object v1, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->FALSE:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->TRUE:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->INPUT:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    aput-object v1, v0, v4

    sput-object v0, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->$VALUES:[Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

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
    .line 66
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;
    .locals 1
    .parameter "name"

    .prologue
    .line 66
    const-class v0, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;
    .locals 1

    .prologue
    .line 66
    sget-object v0, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->$VALUES:[Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    return-object v0
.end method
