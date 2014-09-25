.class public final enum Lorg/eclipse/jgit/patch/FormatError$Severity;
.super Ljava/lang/Enum;
.source "FormatError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/patch/FormatError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Severity"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/patch/FormatError$Severity;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/patch/FormatError$Severity;

.field public static final enum ERROR:Lorg/eclipse/jgit/patch/FormatError$Severity;

.field public static final enum WARNING:Lorg/eclipse/jgit/patch/FormatError$Severity;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 54
    new-instance v0, Lorg/eclipse/jgit/patch/FormatError$Severity;

    const-string v1, "WARNING"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/patch/FormatError$Severity;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/patch/FormatError$Severity;->WARNING:Lorg/eclipse/jgit/patch/FormatError$Severity;

    .line 57
    new-instance v0, Lorg/eclipse/jgit/patch/FormatError$Severity;

    const-string v1, "ERROR"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/patch/FormatError$Severity;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/patch/FormatError$Severity;->ERROR:Lorg/eclipse/jgit/patch/FormatError$Severity;

    .line 52
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/eclipse/jgit/patch/FormatError$Severity;

    sget-object v1, Lorg/eclipse/jgit/patch/FormatError$Severity;->WARNING:Lorg/eclipse/jgit/patch/FormatError$Severity;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/patch/FormatError$Severity;->ERROR:Lorg/eclipse/jgit/patch/FormatError$Severity;

    aput-object v1, v0, v3

    sput-object v0, Lorg/eclipse/jgit/patch/FormatError$Severity;->$VALUES:[Lorg/eclipse/jgit/patch/FormatError$Severity;

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
    .line 52
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/patch/FormatError$Severity;
    .locals 1
    .parameter "name"

    .prologue
    .line 52
    const-class v0, Lorg/eclipse/jgit/patch/FormatError$Severity;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/patch/FormatError$Severity;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/patch/FormatError$Severity;
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lorg/eclipse/jgit/patch/FormatError$Severity;->$VALUES:[Lorg/eclipse/jgit/patch/FormatError$Severity;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/patch/FormatError$Severity;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/patch/FormatError$Severity;

    return-object v0
.end method
